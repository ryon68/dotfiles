"========================
" Options Setup
"========================

" runtimepath for fzf
" set rtp+=/usr/local/opt/fzf
set rtp+=$HOME/.fzf/bin/fzf

" tag file
set tag+=~/.tags,./.tags

"{{{ Searching
set incsearch   " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase  " 検索パターンに大文字小文字を区別しない
set smartcase   " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch    " 検索結果をハイライト
set wrapscan    " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault    " 置換の時 g オプションをデフォルトで有効にする
set showmatch   " 対応する括弧を強調表示
set matchtime=2 " 対応する括弧の強調表示時間を設定する
" source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
runtime /opt/local/share/nvim/runtime/macros/matchit.vim
"}}}

"{{{ Edit
" Tabs. May be overriten by autocmd rules
set expandtab     " タブ入力を複数の空白入力に置き換える/置き換えない
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
" Fix backspace indent
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
" Copy/Paste/Cut
set clipboard+=unnamedplus
" Indent
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set cindent       " C言語スタイルのインデント
" スペルチェックで日本語を除外する
set spelllang=en,cjk
"}}}


"{{{ Encoding
set enc=utf-8
scriptenc utf-8
set fenc=utf-8                         " 保存時の文字コード
set fileencodings=ucs_bom,utf-8,ucs-2le,ucs-2,cp932
" set fencs=ucs-boms,utf-8,euc-jp,cp932  " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac           " 改行コードの自動判別. 左側が優先される
set fencs=utf-8,sjis
"set bomb
"set binary
"}}}

"{{{ Backup Swap
" Directories for swp files
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない
set autoread   " 外部でファイルに変更がされた場合は読みなおす
"}}}

" Undo NoLimit
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" Completion
set wildmenu wildmode=list:longest,full " コマンドモードの補完
set history=5000                        " 保存するコマンド履歴の数
" preview
" set cot=menuone
set completeopt-=preview

" マウス設定
set mouse=a
set mousemodel=popup
" スクロール余白

" Use modeline overrides
set modeline
set modelines=10

" モード変更の時間
set ttimeoutlen=50

" 画面分割時
set splitbelow  " open splitwindow below
set splitright  " open splitwindow right

" Open Vim internal hellp by K
" set keywordprg=:help
