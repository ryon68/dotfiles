#=====================
# zsh main settings
#=====================
#{{{

# zmodload zsh/zprof && zprof

export ZDOTDIR="${HOME}/.zsh"
# export ZDOTDIR="${HOME}/dotfiles/.zsh"

for src in ${ZDOTDIR}/zshrc/*.zsh; do
  [ $src -nt ${ZDOTDIR}/.zshrc ] && source ${ZDOTDIR}/make.sh
done

# path settings
#{{{
path=( \
  /opt/local/bin(N-/) \
  /opt/local/sbin(N-/) \
  /usr/local/bin(N-/) \
  /usr/local/sbin(N-/) \
  ${HOME}/local/bin(N-/) \
  $path \
  )

fpath=( \
  /${ZDOTDIR}/functions(N-/) \
  /${ZDOTDIR}/completion(N-/) \
  $fpath \
  )

manpath=( \
  /usr/share/man(N-/) \
  /opt/local/share/man(N-/) \
  /usr/local/share/man(N-/) \
  $manpath \
  )

# 重複読み込み回避
typeset -U path PATH
typeset -U manpath MANPATH
typeset -U fpath FPATH
typeset -U pythonpath PYTHONPATH
# typeset -U dyld_library_path DYLD_LIBRARY_PATH
#}}}

# Kernel name
export KERNEL_NAME=`uname -s`

# 文字コード設定
# export LANGAGE="ja_JP.eucJP"
export LANGAGE=ja_JP.UTF-8
export LANG=$LANGAGE

# History
export HISTFILE=${HOME}/.zsh/history/.zsh_history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
# ヒストリの一覧を読みやすい形に変更
export HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

# # fzf
# [ -f ${HOME}/.fzf.`basename $SHELL` ] && source ${HOME}/.fzf.`basename $SHELL`

# EDITOR nvim/vim
# if [ -x `which nvim` ]; then
if (( $+commands[nvim] )); then
  export EDITOR=nvim
  # nvim config
  export XDG_CONFIG_HOME=${HOME}/.config
else
  export EDITOR=vim
fi
export VISUAL=${EDITOR}

# PAGER
export PAGER=less
# Less status line
export LESS='-R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export LESSCHARSET='utf-8'
# less colors
export LESS='-R'
export LESSOPEN='| /opt/local/bin/src-hilite-lesspipe.sh %s'
export MORE='-R'
export MOREOPEN='| /opt/local/bin/src-hilite-lesspipe.sh %s'
export GREP_OPTIONS='--color=always'
# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# ls command colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# gf3 source setting file
source ${HOME}/local/rw05/.radware.bashrc

# ROOT source setting file
source `root-config --prefix`/bin/thisroot.sh

# Geant4
#export G4WORKDIR=$HOME/work/geant4
# export G4WORKDIR=$HOME/2017/neutron_detector/Geant4
source /opt/local/bin/geant4.sh
source /opt/local/share/Geant4/Geant4-10.3.3/geant4make/geant4make.sh

# }}}
