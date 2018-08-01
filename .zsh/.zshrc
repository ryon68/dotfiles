#==============================
# zsh 分割設定ファイル
#==============================

# ${ZDOTDIR} を設定したので、このファイルにはリンクを張らなくても良い。
# 主に環境変数の設定
if [ -f ${ZDOTDIR}/rc/main.zsh ]; then
  source ${ZDOTDIR}/rc/main.zsh
fi

# 主に zsh 特有のオプションの設定
if [ -f ${ZDOTDIR}/rc/option.zsh ]; then
  source ${ZDOTDIR}/rc/option.zsh
fi

# 主にエイリアスの設定
if [ -f ${ZDOTDIR}/rc/alias.zsh ]; then
  source ${ZDOTDIR}/rc/alias.zsh
fi

# 主にkeybindの設定
if [ -f ${ZDOTDIR}/rc/keybind.zsh ]; then
  source ${ZDOTDIR}/rc/keybind.zsh
fi

# for my functions
if [ -f ${ZDOTDIR}/rc/func.zsh ]; then
  source ${ZDOTDIR}/rc/func.zsh
fi

# for visual settings
if [ -f ${ZDOTDIR}/rc/visual.zsh ]; then
  source ${ZDOTDIR}/rc/visual.zsh
fi

# if (which zprof > /dev/null 2>&1) ;then
#   zprof | less
# fi
