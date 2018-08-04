#=============================
# visual settings
#=============================
#{{{
# 色を使用出来るようにする
autoload -Uz colors
colors

case ${UID} in
  0) # root
    PROMPT_USER="%{${fg[red]}%}%#%{${reset_color}%}"
    ;;
  *) # other
    PROMPT_USER="%{${fg[white]}%}%#%{${reset_color}%}"
    ;;
esac
if [ -n "${REMOTEHOST}${SSH_CONNECTION}" ]; then
  PROMPT_PATH="${fg[cyan]}%~${reset_color}"
else # local
  PROMPT_PATH="${fg[yellow]}%~${reset_color}"
fi

# PROMPT="[${PROMPT_USER}@${PROMPT_PATH}] 
# > "
PROMPT="[${PROMPT_PATH}] 
${PROMPT_USER} "

# 右プロンプト
# RPROMPT="[%{${fg[green]}%}%y [%D{%m/%d} %*]%{${reset_color}%}]"
# git branch名表示
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

# コマンド訂正時
SPROMPT="%{${fg[yellow]}%}correct%{${reset_color}%}: %{${fg[red]}%}%R%{${reset_color}%} => %{${fg[cyan]}%}%r%{${reset_color}%} (y|n|a|e)? "
#}}}
