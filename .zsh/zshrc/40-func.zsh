#=============================
# function settings
#=============================
#{{{

# ranger
function ranger-cd {
  tempfile="$(mktemp -t tmp.XXXXXX)"
  /opt/local/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
      cd -- "$(cat "$tempfile")"
    fi
    rm  -- "$tempfile"
  }
  # zle -N ranger-cd

  # C-^ move parent directory
  function cdup() {
    echo
    cd ..
    zle reset-prompt
  }
  zle -N cdup

  # peco history
  function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    # zle accept-line
    # zle clear-screen
    zle reset-prompt
  }
  zle -N peco-history-selection

  #awk
  awk_ailas() {
    autoload -Uz is-at-least
    if ! is-at-least 5; then
      return 1
    fi

    local -a opts
    local    field=0 pattern file

    if (( $#==0 )); then
      echo "usage: awk [-option] [\"pattern\"] [file]"
      return 1
    fi
    while (( $# > 0 ))
      # while  [ -n $1 ] 
    do
      case "$1" in
        -*|--*)
          opts+=( "$1" )
          ;;
        *)
          if [[ $1 =~ ^[0-9]+$ ]]; then
            field="$1"
            # echo $field
          elif [ -f $1 ]; then
            file="$1"
          else
            pattern="$1"
            # echo $pattern
          fi
          ;;
      esac
      shift
    done

    # echo "awk ${=opts[@]} "$pattern{print $"$field"}" $file"

    # if ! awk ${=opts[@]} "$"$field" ~ $pattern{print $"$field"}" $file 2>/dev/null; then
    # if ! awk ${=opts[@]} "$"$field" ~ \"$pattern\"{print}" $file 2>/dev/null; then
    if ! awk ${=opts[@]} "$pattern{print $"$field"}" $file 2>/dev/null; then
      printf "alias: syntax error\n"
      return 1
    fi
  }
  zle -N awk_ailas

  #}}}
