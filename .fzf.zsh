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
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --ansi --multi'
export FZF_DEFAULT_COMMAND='rg --files -hidden --follow --glob'
