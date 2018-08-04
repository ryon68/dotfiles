#================
# zsh aliases
#================
#{{{

# zsh alias
alias szsh='source ~/.zsh/.zshrc'
alias relogin='exec zsh -l'

# sudoでaliasを使用可
alias sudo='sudo '

# update locate
alias updatedb='sudo /usr/libexec/locate.updatedb'

# multi mv
autoload -Uz zmv
alias zmv='noglob zmv -W'

# list alias
#{{{
# ls color setting for OS 
case ${OSTYPE} in
  darwin*)
    # Mac用の設定
    export CLICOLOR='true'
    alias ls='ls -G'
    ;;
  linux*)
    # Linux用の設定
    alias ls='ls -G --color=auto'
    ;;
esac
alias la='ls -AF'
alias lla='ls -lAF'
alias ll='ls -lF'
alias lr='ls -lR'
#}}}

# common aliases
# exit
alias E="exit"
# copy move 確認、表示、ディレクトリ
alias cp='cp -irv'
alias mv='mv -iv'
# make directory create with intermediate directories
alias mkdir='mkdir -p'
# ssh use x11
alias ssh='ssh -Y'
# dirs 表示オプション
alias dirs='dirs -v'
alias grep='grep --color=auto'
alias du='du -hsc'
alias df='df -h'
# tree 隠しファイル
alias tree='tree -a'

# use colordiff if exist
if (( $+commands[colordiff] )); then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# vim alias
alias vi=$EDITOR
alias vimdiff="$EDITOR -d"
alias ex="$EDITOR -e"
alias exim="$EDITOR -E"
alias evim="$EDITOR -y"
alias view="$EDITOR -R"
alias rvim="$EDITOR -Z"
alias rview="$EDITOR -RZ"
alias gvim=mvim
alias gview="mvim -R"
alias gvimdiff="mvim -d"
alias gex="mvim -e"
alias gexim="mvim -E"
alias rgvim="mvim -Z"
alias rgview="mvim -RZ"
alias novim='vim -N -u NONE -i NONE'

# global alias
if (( $+commands[rg] )); then
  alias -g G='| rg '
else
  alias -g G='| grep '
fi
alias -g G='| multi_grep '
alias -g L='| less -R'
alias -g P='| peco '
alias -g F='| fzf '
alias -g X='| xargs'
alias -g SO='| sort'
alias -g SE='| sed'
# alias -g A='| awk'
alias -g V='| ${EDITOR} -'
alias -g VI='| xargs -o ${EDITOR}'
alias -g N=" >/dev/null 2>&1"
alias -g N1=" >/dev/null"
alias -g N2=" 2>/dev/null"

multi_grep() {
  local std_in="$(cat <&0)" word

  for word in "$@"
  do
    std_in="$(echo "${std_in}" | command grep "$word")"
  done

  echo "${std_in}"
}

# alias awk=awk_ailas
alias -g A='| awk_ailas'
# alias -g A='| awk'

# ripgrep dotfiles
if (( $+commands[rg] )); then
  alias rg='rg -uu '
fi

# remove to Trash
if (( $+commands[rmtrash] )); then
  alias rm=rmtrash
else
  alias rm=rm
fi
# remove to trash
alias remove='\rm -irv'

# root
# root not display logo
if (( $+commands[root] )); then
  #   # alias root='root -l'
  alias rootg++='g++ `root-config --cflags --libs`' # root compile g++
  if (( $+commands[root5] )); then
    alias root5='root5 -l'
  fi
  if (( $+commands[root6] )); then 
    alias root6='root6 -l'
  fi
fi

# if (( $+commands[tmux] )); then
  # alias tmux='tmux -2'
  # alias tmls='tmux ls'
  # alias tmat='tmux a -t'
  # alias tmns='tmux new-session -s'
# fi

if (( $+commands[git] )); then
    alias ga='git add'
    alias gaa='git add -A'
    alias gc='git commit'
    alias gcm='git commit -m'
    alias gcma='git commit -ma'
    alias gp='git push'
    alias gst='git status'
    alias gd='git diff'
    alias gco='git checkout'
fi

# lldb
alias lldb='lldb-mp-5.0'
alias gdb='lldb-mi-mp-5.0'

# python
alias python2='python2.7'
alias python3='python3.6'
# pip
alias pip3='pip-3.6'
alias pip2='pip-2.7'

alias p="print -l"

#}}}
