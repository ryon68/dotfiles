PS1='\u@\h:\W \$ '

. ~/local/root/pro/bin/thisroot.sh

#gf3
source /usr/local/rw05/.radware.bashrc

#root
#ROOT起動時のロゴをオフにする
alias root='root -l'

#ROOTのパス設定
#ROOTVERSION=6.08.06
#export ROOTSYS=/usr/local/root_v${ROOTVERSION}
#export PATH=${ROOTSYS}/bin:${PATH}
#export DYLD_LIBRARY_PATH=${ROOTSYS}/lib:${DYLD_LIBRARY_PATH}

#PythonからROOTのライブラリへのパス
export PYTHONPATH=${ROOTSYS}/lib:${PYTHONPATH}

#g++コンパイラでROOTのライブラリを使えるようにする
alias rg++='g++ `root-config --cflags --libs`'

#geant4
#export G4WORKDIR=$HOME/work/geant4
. /opt/local/bin/geant4.sh
. /opt/local/share/Geant4/Geant4-10.3.1/geant4make/geant4make.sh
#/op/tlocal/libexec/Geant4/Geant4.10.3/geant4.sh

# MacPorts Installer addition on 2017-05-26_at_17:48:14: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2017-05-26_at_17:48:14: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

alias ll='ls -alFh '
alias la='ls -Ah  '
alias l='ls -CF  '

alias rm='rm -irv'
alias rf='rm -frv'
alias mv='mv -iv'
alias cp='cp -irv'
alias E='exit'
alias vim='reattach-to-user-namespace vim'
alias vi='vim'
alias ssh='TERM=xterm ssh'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
