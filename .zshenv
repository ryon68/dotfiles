# zmodload zsh/zprof && zprof

export ZDOTDIR="${HOME}/.zsh"
# export ZDOTDIR="${HOME}/dotfiles/.zsh"

for src in ${ZDOTDIR}/zshrc/*.zsh; do
  [ $src -nt ${ZDOTDIR}/.zshrc ] && source ${ZDOTDIR}/make.sh
done
