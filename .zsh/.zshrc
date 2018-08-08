#==============================
# zshrc 分割ファイル読み込み
#==============================

# tmux
# if [[ -z "$TMUX" ]]; then
#   tmux new-session;
#   exit;
# fi

for src in ${ZDOTDIR}/zshrc/*.zsh; do
    source $src
done

# zsh起動時にtmux起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux

# fzf
[ -f ${HOME}/.fzf.`basename $SHELL` ] && source ${HOME}/.fzf.`basename $SHELL`

# enhancd
[ -f ${HOME}/.zsh/plugin/enhancd/init.sh ] && source ${HOME}/.zsh/plugin/enhancd/init.sh


# if (which zprof > /dev/null 2>&1) ;then
#   zprof | less
# fi

