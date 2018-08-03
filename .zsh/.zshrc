#=====================
# zsh main settings
#=====================
#{{{

# path settings
#{{{
path=( \
  /opt/local/bin(N-/) \
  /opt/local/sbin(N-/) \
  /usr/local/bin(N-/) \
  /usr/local/sbin(N-/) \
  ${HOME}/local/bin(N-/) \
  $path \
  )

fpath=( \
  /${ZDOTDIR}/functions(N-/) \
  /${ZDOTDIR}/completion(N-/) \
  $fpath \
  )

manpath=( \
  /usr/share/man(N-/) \
  /opt/local/share/man(N-/) \
  /usr/local/share/man(N-/) \
  $manpath \
  )

# 重複読み込み回避
typeset -U path PATH
typeset -U manpath MANPATH
typeset -U fpath FPATH
typeset -U pythonpath PYTHONPATH
# typeset -U dyld_library_path DYLD_LIBRARY_PATH
#}}}

# Kernel name
export KERNEL_NAME=`uname -s`

# 文字コード設定
# export LANGAGE="ja_JP.eucJP"
export LANGAGE=ja_JP.UTF-8
export LANG=$LANGAGE

# History
export HISTFILE=${HOME}/.zsh/history/.zsh_history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
# ヒストリの一覧を読みやすい形に変更
export HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

# # fzf
[ -f ${HOME}/.fzf.`basename $SHELL` ] && source ${HOME}/.fzf.`basename $SHELL`

# EDITOR nvim/vim
if [ -x `which nvim` ]; then
  export EDITOR=nvim
  # nvim config
  export XDG_CONFIG_HOME=${HOME}/.config
else
  export EDITOR=vim
fi
export VISUAL=${EDITOR}

# PAGER
export PAGER=less
# Less status line
export LESS='-R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export LESSCHARSET='utf-8'
# less colors
export LESS='-R'
export LESSOPEN='| /opt/local/bin/src-hilite-lesspipe.sh %s'
export MORE='-R'
export MOREOPEN='| /opt/local/bin/src-hilite-lesspipe.sh %s'
export GREP_OPTIONS='--color=always'
# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# ls command colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

source ${HOME}/local/rw05/.radware.bashrc

# ROOT source setting file
source `root-config --prefix`/bin/thisroot.sh

# Geant4
#export G4WORKDIR=$HOME/work/geant4
# export G4WORKDIR=$HOME/2017/neutron_detector/Geant4
source /opt/local/bin/geant4.sh
source /opt/local/share/Geant4/Geant4-10.3.3/geant4make/geant4make.sh

# shell integrarion
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source ${HOME}/.iterm2_shell_integration.`basename $SHELL`

# export DYLD_LIBRARY_PATH=/opt/local/lib:$DYLD_LIBRARY_PATH

# setting for python
if (( $+commands[python] )); then
  path+=(/opt/local/Library/Frameworks/Python.framework/Versions/3.6/bin(N-/))
  # PythonからROOTのライブラリへのパス
  export PYTHONPATH=${ROOTSYS}/lib:$PYTHONPATH
  # export PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages:${PYTHONPATH}
fi

# setting for golang
if (( $+commands[go] )); then
  export GOPATH=$HOME/go
  path+=($GOPATH/bin(N-/))
fi

# setting fot nodebrew
if (( $+commands[nodebrew] )); then
  path+=($HOME/.nodebrew/current/bin(N-/))
fi

# setting for cargo
# if (( $+commands[cargo] )); then
path+=($HOME/.cargo/bin(N-/))
# fi

# virtualenv
# export VIRTUALENVWRAPPER_PYTHON='/opt/local/bin/python3.6'
# export VIRTUALENVWRAPPER_VIRTUALENV='/opt/local/bin/virtualenv-3.6'
# export VIRTUALENVWRAPPER_VIRTUALENV_CLONE='/opt/local/bin/virtualenv-clone-3.6'
# source /opt/local/bin/virtualenvwrapper.sh-3.6

#}}}
#=============================
# option settings
#=============================
#{{{

#-----------------------------
# load original functions
#-----------------------------
autoload -Uz nyan
autoload -Uz vizshrc
autoload -Uz vitoml
autoload -Uz vivimrc

#----------------------
# zsh option setting
#----------------------

# 色を使用出来るようにする
# autoload -Uz colors
# colors

# cdの後にlsを実行
chpwd() { ls -G -F }

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default

# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

### 補完
fpath=(\
  /opt/local/var/macports/software/zsh-completions \
  $fpath \
  )
## 補完機能を有効にする
autoload -Uz compinit
compinit -C

# 補完メッセージを読みやすくする
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
# 補完関数の表示を強化する
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''
zstyle ':completion::complete:*' use-cache true
#zstyle ':completion:*:default' menu select true
zstyle ':completion:*:default' menu select=1
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /opt/local/sbin /opt/local/bin \
  /usr/local/sbin /usr/local/bin \
  /usr/sbin /usr/bin /sbin /bin /opt/X11/bin /usr/X11R6/bin
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

#補完でカラーを使用する
# autoload colors
[ -n ${LS_COLORS} ] && zstyle ':completion:*' list-colors "${LS_COLORS}"

#kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
# [ -n ${LS_COLORS} ] &&  zstyle ':completion:*:*:kill:*:processes' list-colors "${LS_COLORS}"

#入力途中の履歴補完有効化する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

#-----------------------------------
# setopt
#-----------------------------------
#-----------------------------------
# Changing Directories
#-----------------------------------
# コマンド名が無い場合はその名前でcdを試みる
setopt AUTO_CD
# cdしたらカレントディレクトリをpushdする
setopt AUTO_PUSHD
# ディレクトリが見つからない場合に先頭に~をつけて試行する
setopt CDABLE_VARS
# リンク先を絶対参照して..を処理する
#setopt CHASE_DOTS
# どんなときもsymlinkを追跡してオリジナルにcdする
unsetopt CHASE_LINKS
# よりPOSIX標準に準拠する
#setopt POSIX_CD
# 同じディレクトリは2度pushdしない
setopt PUSHD_IGNORE_DUPS
# pushdの+と-の意味を交換する
#setopt PUSHD_MINUS
# pushdやpopdで標準出力に何も表示しない
#setopt PUSHD_SILENT
# 引数なしのpushdは'pushd $HOME'になる
#setopt PUSHD_TO_HOME
#-----------------------------------
# Completion
#-----------------------------------
# 補完の出力を上書き
setopt ALWAYS_LAST_PROMPT
# 完全な補完をしたらカーソルを末尾へ移動する
# setopt ALWAYS_TO_END
# 曖昧な補完で候補をリストアップ
setopt AUTO_LIST
# Tabキーを連打しても選択を移動
setopt AUTO_MENU
# 変数がディレクトリの場合に変数名をディレクトリ名として使用できる
setopt AUTO_NAME_DIRS
# 変数名の賢い補完
setopt AUTO_PARAM_KEYS
# ディレクトリを補完すると最後がスペースではなくスラッシュになる
setopt AUTO_PARAM_SLASH
# ディレクトリの補完で付いたスラッシュを自動的に削除する
unsetopt AUTO_REMOVE_SLASH
# Tabを3回押すまでリスト表示しない(ただしMENU_COMPLETEが優先される)
# setopt BASH_AUTO_LIST
# エイリアスを別のコマンド名として処理する
unsetopt COMPLETE_ALIASES
# カーソル部分から補完を開始する
setopt COMPLETE_IN_WORD
# 補完のグロブを展開せずに適合ワードをサイクルする
#setopt GLOB_COMPLETE
# 最初のコマンド補完時にpathの内容をハッシュしない
#unsetopt HASH_LIST_ALL
# 補完候補が一意の時もリスト表示する
#unsetopt LIST_AMBIGUOUS
# Tabを押して補完が成功しない時にビープで通知しない
# unsetopt LIST_BEEP
# コンパクトにして表示量を多くする
setopt LIST_PACKED
# 選択時に横方向に移動する
#setopt LIST_ROWS_FIRST
# ファイルの末尾に種別の識別記号をつける
setopt LIST_TYPES
# リスト表示のときにはじめから一つ挿入する
# setopt MENU_COMPLETE
# 曖昧さが残っていても補完を終了する
#setopt REC_EXACT
#-----------------------------------
# History
#-----------------------------------
# ヒストリファイルをセッションごとに上書きする
setopt APPEND_HISTORY
# Csh形式のヒストリ拡張を使用しない
#unsetopt BANG_HIST
# ヒストリにコマンド実行時間を含める
setopt EXTENDED_HISTORY
# 書き込みリダイレクトで既存ファイル上書きを許可する
#setopt HIST_ALLOW_CLOBBER
# 存在しないヒストリの場合ビープで通知する
#unsetopt HIST_BEEP
# ヒストリが削られる場合、以前入力した同じものを先に削除する
setopt HIST_EXPIRE_DUPS_FIRST
# 書き込み中のヒストリファイルをロックする際にfcntlを使用する
# setopt HIST_FCNTL_LOCK
# ヒストリ検索時に以前見たものを2度は表示しない
setopt HIST_FIND_NO_DUPS
# 以前と同じコマンドはヒストリに保存しない
setopt HIST_IGNORE_ALL_DUPS
# 直前のコマンドと同じコマンドはヒストリに保存しない
setopt HIST_IGNORE_DUPS
# 行頭がスペースのコマンドはヒストリに保存しない
setopt HIST_IGNORE_SPACE
# ヒストリファイルの形式を変更する
# setopt HIST_LEX_WORDS
# ヒストリから関数定義を除去する
setopt HIST_NO_FUNCTIONS
# ヒストリコマンドをヒストリから取り除く
setopt HIST_NO_STORE
# ヒストリ保存時に余分な空白を除去する
setopt HIST_REDUCE_BLANKS
# ヒストリを一旦コピーファイルに保存しない
#unsetopt HIST_SAVE_BY_COPY
# ヒストリファイルに書き出すときに以前のコマンドと同じものを除去する
setopt HIST_SAVE_NO_DUPS
# ヒストリコマンドを直接実行しない
setopt HIST_VERIFY
# ヒストリをヒストリファイルに即座に書き込む
setopt INC_APPEND_HISTORY
# ヒストリ書き込み時間をヒストリファイルに追加する
# setopt INC_APPEND_HISTORY_TIME
# ヒストリの読み出しと書き込みを同時に行う
setopt SHARE_HISTORY
#-----------------------------
# Expansion and Globbing
#
# 他人のzshとの互換性を重視するならば
# 変更は好ましくない。
#-----------------------------------
# 不正なパターン時にエラーメッセージを表示しない
#unsetopt BAD_PATTERN
# グロブを適切に処理
#unsetopt BARE_GLOB_QUAL
# ブレース展開式がただの文字列の場合に一文字ずつ展開
setopt BRACE_CCL
# 大文字小文字を区別しない
#unsetopt CASE_GLOB
# 正規表現を使用しない
#unsetopt CASE_MATCH
# Csh形式でグロブを扱う
#setopt CSH_NULL_GLOB
# =をグロブに使用できなくする
#unsetopt EQUALS
# グロブに追加文字を使用する
setopt EXTENDED_GLOB
# 数値計算を浮動小数点計算として扱う
#setopt FORCE_FLOAT
# グロブを使用しない
#unsetopt GLOB
# 代入式の右辺で不明確なグロブ展開を使用する(非推奨)
#setopt GLOB_ASSIGN
# 明確な場合はファイル名先頭のドットを必要としない
unsetopt GLOB_DOTS
# 変数の内容も展開に使用する
#setopt GLOB_SUBST
# sや&の展開修飾マッチングをパターンマッチにする
# setopt HIST_SUBST_PATTERN
# ブレース展開を無効化する
#setopt IGNORE_BRACES
# コマンド最後の閉じ大カッコ}が必要なくなる。ただし最後のコマンドに;がないとエラーになる
#setopt IGNORE_CLOSE_BRACES
# Ksh形式のグロブを使用する
#setopt KSH_GLOB
# オプションの=以降の補完を可能にする
setopt MAGIC_EQUAL_SUBST
# グロブ展開後のディレクトリには末尾に/を付加する
setopt MARK_DIRS
# マルチバイト文字を扱わない
#unsetopt MULTIBYTE
# ファイル生成パターンのエラーを表示しない
#unsetopt NOMATCH
# エラー表示の代わりにパターンを除去する
#setopt NULL_GLOB
# ファイル名生成を辞書順ではなく数値順にする
setopt NUMERIC_GLOB_SORT
# 展開に含まれる配列を別々に展開する
# setopt RC_EXPAND_PARAM
# 正規表現マッチング(PARAM =~ REGEXP)でperl形式(PCRE)を使用可能にする
#unsetopt REMATCH_PCRE
# kshやshのグロブ
#setopt SH_GLOB
# 定義されていない変数を空文字の変数として扱わない(エラーになる)
#unsetopt UNSET
# 関数内の変数がグローバルとして定義されたら警告を出す
#setopt WARN_CREATE_GLOBAL
#-----------------------------------
# Initialisatons
# - 環境の初期化 -
#
# 他人のzshとの互換性を重視するならば
# 変更は好ましくない。
#-----------------------------------
# すべての変数を自動的にexportする
# setopt ALL_EXPORT
# エクスポートフラグ(-x)をもつ変数が自動的にグローバル(-g)にならない
#unsetopt GLOBAL_EXPORT
# 起動時に/etc/zshenvを除く/etc以下の設定ファイル群を読み込まない
#unsetopt GLOBAL_RCS
# 起動時に/etc/zshenvを除く全ての設定ファイルを読み込まない
#unsetopt RCS
#-----------------------------------
# Input/Output
# - 入力と出力 -
#
# 他人のzshとの互換性を重視するならば
# 変更は好ましくないものがある。
#-----------------------------------
# エイリアスを拡張しない
#unsetopt ALIASES
# リダイレクトによる入出力制御
setopt NOCLOBBER
# スペルミスの修正をする
setopt CORRECT
# コマンド行のすべての引数に対してスペルミスの修正を行う
setopt CORRECT_ALL
# スペルミスの修正時にDvorak配列として修正する
#setopt DVORAK
# フロー制御(Ctrl+s,Ctrl+q)を無効化する
unsetopt FLOW_CONTROL
# EOFを読み込んでも終了しない
setopt IGNORE_EOF
# 対話的シェル(Interactive)でも#以降をコメントとみなす
setopt INTERACTIVE_COMMENTS
# コマンドの場所をそのコマンドの最初の実行時にハッシュしない
#unsetopt HASH_CMDS
# コマンドのハッシュ時にそれを含むディレクトリをハッシュしない
#unsetopt HASH_DIRS
# 実行権限が付与されているコマンド以外はハッシュしない
# setopt HASH_EXECUTABLES_ONLY
# メールファイルにアクセスがあると警告を発する
# setopt MAIL_WARNING
# コマンド名に/が含まれていてもそれを含めたパスの探索を行う
# setopt PATH_DIRS
# 効果不明
#setopt PATH_SCRIPT
# マルチバイト文字を処理する(既に問題ない場合には必要ない)
setopt PRINT_EIGHT_BIT
# 終了コード($?)を表示する
# setopt PRINT_EXIT_VALUE
# シングルクォート内でのシングルクォートを許可する
#setopt RC_QUOTES
# 'rm *'の実行時に警告を表示しない
setopt RM_STAR_SILENT
# 'rm *'の実行前に10秒間の猶予を与える
unsetopt RM_STAR_WAIT
# 省略形式のループ(for等)を許可
setopt SHORT_LOOPS
# バッククォートの数が合わない時に最後のバッククォートを無視する
setopt SUN_KEYBOARD_HACK
#-----------------------------------
# Job Control
# - ジョブコントロール -
#-----------------------------------
# disownコマンドでジョブテーブルから除去したjobに自動的にCONTシグナルを送信する
# setopt AUTO_CONTINUE
# サスペンドしたjobをそのコマンド名で再開する
setopt AUTO_RESUME
# バックグラウンドjobのプライオリティ(優先度)を下げない
#unsetopt BG_NICE
# バックグラウンドjobがある際にzshを終了しても何も警告しない
unsetopt CHECK_JOBS
# 実行中のjobがあるときにzshを終了するとそのジョブにHUPシグナルを送信しない(道連れにする)
#unsetopt HUP
# jobsで表示されるjobリストを冗長にする
#setopt LONG_LIST_JOBS
# jobコントロールを許可する(インタラクティブシェルではデフォルト)
#setopt MONITOR
# バックグラウンドjobが終了たとき即座に通知
setopt NOTIFY
# POSIX標準に準拠したjobコントロールを使用する
#setopt POSIX_JOBS
#-----------------------------------
# Prompting
# - プロンプト表示 -
#-----------------------------------
# プロンプトで!を特殊文字として扱わない
#unsetopt PROMPT_BANG
# プロンプトで改行コードの無い行を出力しない
unsetopt PROMPT_CR
# PROMPT_CRで出力されなかった行を反転文字で通知
#unsetopt PROMPT_SP
# プロンプトで%を特殊文字として扱わない
#unsetopt PROMPT_PERCENT
# プロンプトで拡張変数などを利用する
setopt PROMPT_SUBST
# コマンド実行時に右プロンプトの表示を削除する
setopt TRANSIENT_RPROMPT
#-----------------------------------
# Scripts and Functions
# - スクリプトと関数 -
#
# 互換性を考えるとこのオプションを
# 変更することは好ましくない。
#-----------------------------------
#setopt C_BASES
#setopt C_PRECEDENCES
#setopt DEBUG_BEFORE_CMD
#setopt ERR_EXIT
#setopt ERR_RETURN
#unsetopt EVAL_LINENO
#unsetopt EXEC
setopt FUNCTION_ARGZERO
#setopt LOCAL_LOOPS
#setopt LOCAL_OPTIONS
#setopt LOCAL_PATTERNS
#setopt LOCAL_TRAPS
#unsetopt MULTI_FUNC_DEF
setopt MULTIOS
#setopt OCTAL_ZEROES
#setopt PIPE_FAIL
#setopt SOURCE_TRACE
#setopt TYPESET_SILENT
#setopt VERBOSE
# setopt XTRACE
#-----------------------------------
# Shell Emulation
# - 互換とエミュレーション -
#
# 互換性を考えるとこのオプションを
# 変更することは好ましくない。
#-----------------------------------
#setopt BASH_REMATCH
#setopt BSD_ECHO
#setopt CONTINUE_ON_ERROR
#setopt CSH_JUNKIE_HISTORY
#setopt CSH_JUNKIE_LOOPS
#setopt CSH_JUNKIE_QUOTES
#setopt CSH_NULLCMD
#setopt KSH_ARRAYS
#setopt KSH_AUTOLOAD
#setopt KSH_OPTION_PRINT
#setopt KSH_TYPESET
#setopt KSH_ZERO_SUBSCRIPT
#setopt POSIX_ALIASES
#setopt POSIX_ARGZERO
#setopt POSIX_BUILTINS
#setopt POSIX_IDENTIFIERS
#setopt POSIX_STRINGS
#setopt POSIX_TRAPS
#setopt SH_FILE_EXPANSION
#setopt SH_NULLCMD
#setopt SH_OPTION_LETTERS
setopt SH_WORD_SPLIT
#setopt TRAPS_ASYNC
#-----------------------------------
# Shell State
# - シェルの種類 -
#-----------------------------------
#setopt INTERACTIVE
#setopt LOGIN
#setopt PRIVILEGED
#setopt RESTRICTED
#setopt SHIN_STDIN
#setopt SINGLE_COMMAND
#-----------------------------------
# Zsh Line Editor (ZLE)
# - ZLE -
#-----------------------------------
# ZLEのエラー時にビープで通知しない
unsetopt BEEP
# 通常では使用されない特殊記号を正しく表示する
#setopt COMBINING_CHARS
# Emacsのキーバインディングを使用する
#setopt EMACS
# ZLEをOverstrikeモードで起動
#setopt OVERSTRIKE
# シングルラインエディットにする
unsetopt SINGLE_LINE_ZLE
# Viのキーバインディングを使用する
# setopt VI
# ZLEを使用する(インタラクティブシェルではデフォルト)
setopt ZLE
#}}}
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
  # PROMPT_PATH="%{${fg[cyan]}%}%(5~,.../%3~,%~)%{${reset_color}%}"
  PROMPT_PATH="${fg[cyan]}%~${reset_color}"
else # local
  # PROMPT_PATH="%{${fg[yellow}%}%(5~,.../%3~,%~)%{${reset_color}%}"
  PROMPT_PATH="${fg[yellow]}%~${reset_color}"
fi

# PROMPT="[%{${fg[yellow]}%}%~%{${reset_color}%}]
# %# "
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
#=============================
# function settings
#=============================
#{{{

# ranger
function ranger-cd {
  tempfile="$(mktemp -t tmp.XXXXXX)"
  /opt/local/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
      cd -- "$(cat "$tempfile")"
    fi
    rm  -- "$tempfile"
  }
  # zle -N ranger-cd

# C-^ move parent directory
function cdup() {
  echo
  cd ..
  zle reset-prompt
}
zle -N cdup

# peco history
function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  # zle accept-line
  # zle clear-screen
  zle reset-prompt
}
zle -N peco-history-selection

#-------
# fzf
#-------
# tree-fzf
function tree-fzf() {
  local SELECTED_FILE=$(tree --charset=o -f | fzf --query "$LBUFFER" | tr -d '\||`|-' | xargs echo)

  if [ "$SELECTED_FILE" != "" ]; then
    BUFFER="$EDITOR $SELECTED_FILE"
    zle accept-line
  fi

  zle reset-prompt
}
zle -N tree-fzf

# ssh-fzf
function ssh-fzf () {
  local selected_host=$(rg HOST ~/.ssh/config | cut -b 6- | fzf --query "$LBUFFER")

  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N ssh-fzf

# history-fzf
function history-fzf() {
  local tac

  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi

  BUFFER=$(history -n 1 | eval $tac | fzf --query "$LBUFFER")
  CURSOR=$#BUFFER

  zle reset-prompt
}
zle -N history-fzf

# ghq-fzf
function ghq-fzf() {
  local selected_dir=$(ghq list | fzf --query="$LBUFFER")

  if [ -n "$selected_dir" ]; then
    BUFFER="cd $(ghq root)/${selected_dir}"
    zle accept-line
  fi

  zle reset-prompt
}
zle -N ghq-fzf
#}}}
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
#================
# zsh aliases
#================
#{{{

# zsh alias
alias szsh='source ~/.zsh/.zshrc'
# alias czsh='zcompile ~/.zsh/.zshrc'
alias relogin='exec zsh -l'

# sudo alias
alias sudo='sudo '

# update locate
alias updatedb='sudo /usr/libexec/locate.updatedb'

# ls alias
#{{{
# ls color setting for OS 
case ${OSTYPE} in
  darwin*)
    # Mac用の設定
    export CLICOLOR='true'
    alias ls='ls -G -F -h'
    ;;
  linux*)
    # Linux用の設定
    alias ls='ls -F --color=auto'
    ;;
esac
alias la='ls -ax'
alias ll='ls -alhp'
alias l='ls -Bx'
#}}}

# global alias
if (( $+commands[rg] )); then
  alias -g G='| rg '
else
  alias -g G='| grep '
fi
alias -g L='| less -R'
alias -g P='| peco '
alias -g F='| fzf '
alias -g X='| xargs'
alias -g S="| sort"
# alias -g N=" >/dev/null 2>&1"
# alias -g N1=" >/dev/null"
# alias -g N2=" 2>/dev/null"
# alias -g VI='| xargs -o vim'

# exit
alias E="exit"
# copy move 確認、表示、ディレクトリ
alias cp='cp -irv'
alias mv='mv -iv'
# make directory create with intermediate directories
alias mkdir='mkdir -p'
# ssh use x11
alias ssh='ssh -Y'
# dirs 表示オプション
alias dirs='dirs -v'

# ripgrep dotfiles
if (( $+commands[rg] )); then
  alias rg='rg -uu '
fi

# tree 隠しファイル
alias tree='tree -a'

# remove to Trash
if (( $+commands[rmtrash] )); then
  alias rm=rmtrash
else
  alias rm=rm
fi
# remove to trash
alias remove='\rm -irv'

# colordiff
if (( $+commands[colordiff] )); then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# colordiff

# vim alias
alias vi=${EDITOR}
alias vimdiff="${EDITOR} -d"
alias ex="${EDITOR} -e"
alias exim="${EDITOR} -E"
alias evim="${EDITOR} -y"
alias view="${EDITOR} -R"
alias rvim="${EDITOR} -Z"
alias rview="${EDITOR} -RZ"
alias gvim=mvim
alias gview="mvim -R"
alias gvimdiff="mvim -d"
alias gex="mvim -e"
alias gexim="mvim -E"
alias rgvim="mvim -Z"
alias rgview="mvim -RZ"

# root
# root not display logo
if (( $+commands[root] )); then
  #   # alias root='root -l'
  alias rootg++='g++ `root-config --cflags --libs`' # root compile g++
  if (( $+commands[root5] )); then
    alias root5='root5 -l'
  fi
  if (( $+commands[root6] )); then 
    alias root6='root6 -l'
  fi
fi

# lldb
alias lldb='lldb-mp-5.0'
alias gdb='lldb-mi-mp-5.0'

# python
alias python2='python2.7'
alias python3='python3.6'
# pip
alias pip3='pip-3.6'
alias pip2='pip-2.7'

alias p="print -l"

#}}}
