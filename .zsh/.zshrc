#==============================
# zsh 分割設定ファイル
#==============================

# tmux
# if [[ -z "$TMUX" ]]; then
#   tmux new-session;
#   exit;
# fi

for src in ${ZDOTDIR}/zshrc/*.zsh; do
    source $src
done

# fzf
# [ -f ${HOME}/.fzf.`basename $SHELL` ] && source ${HOME}/.fzf.`basename $SHELL`

# if (which zprof > /dev/null 2>&1) ;then
#   zprof | less
# fi

