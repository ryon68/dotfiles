# Setup fzf
# ---------
if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
  export PATH="$PATH:${HOME}/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOME}/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${HOME}/.fzf/shell/key-bindings.zsh"

# options
# -------
# select-1 候補が1つのときに自動で選択
# exit-0   選択候補がないとき自動で終了
export FZF_ALT_C_OPTS="--select-1 --exit-0"
# コマンドが長過ぎるとき?でプレビュー
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

export FZF_DEFAULT_OPTS='--height 40% --reverse --ansi --multi'
export FZF_DEFAULT_COMMAND='rg --files -hidden --follow --glob'
