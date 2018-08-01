#=====================
# zsh main settings
#=====================

# path settings
#{{{
path=(\
  /opt/local/bin(N-/) \
  /opt/local/sbin(N-/) \
  /usr/local/bin(N-/) \
  /usr/local/sbin(N-/) \
  ${HOME}/local/bin(N-/) \
  /opt/local/Library/Frameworks/Python.framework/Versions/3.6/bin(N-/) \
  ${HOME}/.cargo/bin(N-/) \
  ${HOME}/go/bin(N-/) \
  ${HOME}/.nodebrew/current/bin(N-/) \
  $path \
  )

manpath=(\
  /opt/local/share/man(N-/) \
  /usr/local/share/man(N-/) \
  $manpath \
  )

# export DYLD_LIBRARY_PATH=/opt/local/lib:$DYLD_LIBRARY_PATH

# /opt/local/var/macports/software/zsh-completions
# zsh original func 
export FPATH=${ZDOTDIR}/functions:$FPATH

# go working directory
export GOPAHT=${HOME}/go:$GOPATH

# PythonからROOTのライブラリへのパス
export PYTHONPATH=${ROOTSYS}/lib:$PYTHONPATH
# export PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages:${PYTHONPATH}

#--------------------
# 重複読み込み回避
#--------------------
typeset -U path PATH
typeset -U manpath MANPATH
typeset -U fpath FPATH
typeset -U pythonpath PYTHONPATH
typeset -U dyld_library_path DYLD_LIBRARY_PATH
#}}}

# Kernel name
export KERNEL_NAME=`uname -s`

# 文字コード設定
# export LANGAGE="ja_JP.eucJP"
export LANGAGE=ja_JP.UTF-8
export LANG=$LANGAGE

# shell integrarion
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source ${HOME}/.iterm2_shell_integration.`basename $SHELL`

# History
export HISTFILE=${HOME}/.zsh/history/.zsh_history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
# ヒストリの一覧を読みやすい形に変更
export HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "


# EDITER nvim/vim
if [ -x `which nvim` ]; then
  export EDITER=nvim
  export VISUAL=nvim
  # nvim config
  export XDG_CONFIG_HOME=${HOME}/.config
else
  export EDITER=vim
  export VISUAL=vim
fi
# PAGER
export PAGER=less

# fzf
[ -f ~/.fzf.`basename $SHELL` ] && source ~/.fzf.`basename $SHELL`

# tmux 起動
# if [[ -x `which tmux` ]]; then
  # tmux
# fi

# enhancd
# source ${ZDOTDIR}/plugins/enhancd/init.sh
# export ENHANCD_FILTER=

# remove to Trash
if [ -x `which rmtrash` ]; then
  export RM=rmtrash
else
  export RM=rm
fi

# colordiff
if [ -x `which colordiff` ]; then
  export DIFF=colordiff
else
  alias DIFF=diff
fi

# gf3 source setting file
source ${HOME}/local/rw05/.radware.bashrc

# ROOT source setting file
source `root-config --prefix`/bin/thisroot.sh

# Geant4
#export G4WORKDIR=$HOME/work/geant4
# export G4WORKDIR=$HOME/2017/neutron_detector/Geant4
source /opt/local/bin/geant4.sh
source /opt/local/share/Geant4/Geant4-10.3.3/geant4make/geant4make.sh

# less 色付け
export LESS='-R'
export LESSOPEN='| /opt/local/bin/src-hilite-lesspipe.sh %s'
export MORE='-R'
export MOREOPEN='| /opt/local/bin/src-hilite-lesspipe.sh %s'
export GREP_OPTIONS='--color=always'

# virtualenv
export VIRTUALENVWRAPPER_PYTHON='/opt/local/bin/python3.6'
export VIRTUALENVWRAPPER_VIRTUALENV='/opt/local/bin/virtualenv-3.6'
export VIRTUALENVWRAPPER_VIRTUALENV_CLONE='/opt/local/bin/virtualenv-clone-3.6'
# source /opt/local/bin/virtualenvwrapper.sh-3.6

