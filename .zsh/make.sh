#!/bin/zsh

() {

local src

[ -e ${ZDOTDIR}/.zcompdump ] && \rm -f ${ZDOTDIR}/.zcompdump  # Clear zcomp cache

for src in $@; do
  
[ ! -e ${ZDOTDIR}/$src ] && touch ${ZDOTDIR}/."$src"
: >! ."$src"

if [ -n "(ls ${ZDOTDIR}/$src/)" ]; then
command ls ${ZDOTDIR}/$src/*.zsh   | sort | xargs cat >! ${ZDOTDIR}/."$src"
fi

zsh -n ${ZDOTDIR}/."$src" # 文法チェック
zsh -c "zcompile ${ZDOTDIR}/."$src" " # コンパイル

done

# } zshenv zshrc zprofile
# } zshenv zshrc
} zshrc
