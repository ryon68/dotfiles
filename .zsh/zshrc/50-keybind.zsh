#===============
# keybind settings
#===============
#{{{

# reset keybind
bindkey -d
# CLI mode
bindkey -e # emacs
# bindkey -v # vim

# 特殊なkeys
bindkey "^[OH" beginning-of-line 
bindkey "^[OF" end-of-line
bindkey "^[[3~" delete-char # fn-delete

# move cusor at completion
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# incremental serch
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

#--------------------------
# for original functions 
#--------------------------

# ranger
bindkey  -s '^o' 'ranger-cd\n'
## C-^ move parent directory
bindkey '^^' cdup
# peco-history
bindkey '^H' peco-history-selection
# fzf
# tree-fzf
bindkey "^t" tree-fzf
# ssh-fzf
bindkey '^\' ssh-fzf
# history-fzf
bindkey '^r' history-fzf
# ghq-fzf
bindkey "^]" ghq-fzf
#}}}
