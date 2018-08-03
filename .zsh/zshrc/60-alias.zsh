#================
# zsh aliases
#================
#{{{

# zsh alias
alias szsh='source ~/.zsh/.zshrc'
# alias czsh='zcompile ~/.zsh/.zshrc'
alias relogin='exec zsh -l'

# sudo alias
alias sudo='sudo '

# update locate
alias updatedb='sudo /usr/libexec/locate.updatedb'

# ls alias
#{{{
# ls color setting for OS 
case ${OSTYPE} in
  darwin*)
    # Mac用の設定
    export CLICOLOR='true'
    alias ls='ls -G -F -h'
    ;;
  linux*)
    # Linux用の設定
    alias ls='ls -F --color=auto'
    ;;
esac
alias la='ls -ax'
alias ll='ls -alhp'
alias l='ls -Bx'
#}}}

# global alias
if (( $+commands[rg] )); then
  alias -g G='| rg '
else
  alias -g G='| grep '
fi
alias -g L='| less -R'
alias -g P='| peco '
alias -g F='| fzf '
alias -g X='| xargs'
alias -g S="| sort"
# alias -g N=" >/dev/null 2>&1"
# alias -g N1=" >/dev/null"
# alias -g N2=" 2>/dev/null"
# alias -g VI='| xargs -o vim'

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

# ripgrep dotfiles
if (( $+commands[rg] )); then
  alias rg='rg -uu '
fi

# tree 隠しファイル
alias tree='tree -a'

# remove to Trash
if (( $+commands[rmtrash] )); then
  alias rm=rmtrash
else
  alias rm=rm
fi
# remove to trash
alias remove='\rm -irv'

# colordiff
if (( $+commands[colordiff] )); then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# colordiff

# vim alias
alias vi=${EDITOR}
alias vimdiff="${EDITOR} -d"
alias ex="${EDITOR} -e"
alias exim="${EDITOR} -E"
alias evim="${EDITOR} -y"
alias view="${EDITOR} -R"
alias rvim="${EDITOR} -Z"
alias rview="${EDITOR} -RZ"
alias gvim=mvim
alias gview="mvim -R"
alias gvimdiff="mvim -d"
alias gex="mvim -e"
alias gexim="mvim -E"
alias rgvim="mvim -Z"
alias rgview="mvim -RZ"

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
