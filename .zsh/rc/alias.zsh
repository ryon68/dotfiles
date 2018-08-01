#================
# zsh aliases
#================

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
alias -g L='| less -R'
alias -g G='| rg '
alias -g P='| peco '
alias -g F='| fzf '

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
[[ -x `which rg` ]] && alias rg='rg -uu '

# tree 隠しファイル
alias tree='tree -a'

# remove to trash
alias rm=${RM}
alias remove='\rm -irv'

# colordiff
  alias diff='${DIFF} -u'

# vim alias
alias vi=${EDITER}
# [[ ${EDITER} == nvim ]] && alias vless="/opt/local/share/nvim/runtime/macros/less.vim"

# root
# root not display logo
if [[ -x `which root` ]]; then
  # alias root='root -l'
  alias rootg++='g++ `root-config --cflags --libs`' # root compile g++
  [[ -x `which root5` ]] && alias root5='root5 -l'
  [[ -x `which root6` ]] && alias root6='root6 -l'
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

