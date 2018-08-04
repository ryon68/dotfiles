# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/nakajima/dotfiles/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/nakajima/dotfiles/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/nakajima/dotfiles/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/nakajima/dotfiles/.fzf/shell/key-bindings.bash"

