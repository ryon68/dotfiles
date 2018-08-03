#!/bin/zsh

() {

local src

[ -e ${ZDOTDIR}/.zcompdump ] && \rm -f ${ZDOTDIR}/.zcompdump  # Clear zcomp cache

for src in $@; do
  
[ ! -e ${ZDOTDIR}/$src ] && touch ${ZDOTDIR}/."$src"
: >! ."$src"

# if [ -e ${ZDOTDIR}/$src/*.zsh ]; then
command ls ${ZDOTDIR}/$src/*.zsh   | sort | xargs cat >! ${ZDOTDIR}/."$src"
# fi

done

zsh -n ${ZDOTDIR}/."$src" # 文法チェック
zsh -c "zcompile ${ZDOTDIR}/."$src" " # コンパイル

# } zshenv zshrc zprofile
} zshrc
