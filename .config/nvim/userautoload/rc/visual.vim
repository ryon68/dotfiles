"====================
" Visual Settings
"====================

" シンタックスハイライトを有効にする
syntax on
" 256色対応
if !has('nvim')
  set t_Co=256
endif
" True color対応
" if has('patch-7.4.1778')
"   set guicolors
" endif
" nvim >= 0.1.5
if has('termguicolors')
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" nvim < 0.1.5
" if has('nvim')
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif

"set colorscheme func SelectColorScheme('dark/light','scheme_name')
call SelectColorScheme('dark','molokai')
" call SelectColorScheme('dark','iceberg')
" call SelectColorScheme('dark','japanesque')
" call SelectColorScheme('dark','snow')
" call SelectColorScheme('light','pencil')
" call SelectColorScheme('light','snow')

" 記号を ASCII 文字の2倍の幅にする
set ambiwidth=double
" ルーラーを表示
set ruler
" 行番号を表示
set number
set scrolloff=3 " 必ずカーソルの前後に指定の行数表示してくれるようにする

" 不可視文字
set list                " 不可視文字を表示
" set listchars=tab:¦\
" set fillchars+=vert:\
set listchars=tab:\|\ " " 不可視文字の表示記号指定
"eol:↲,extends:❯,precedes:❮,tab:\|\
" showbreaks
set showbreak=↪❯

" Statusline
set statusline=%<%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set helpheight=999 " ヘルプを画面いっぱいに開く
" Cursor line
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set cursorline                 " カーソル行の背景色を変える
"set cursorcolumn              " カーソル位置のカラムの背景色を変える
set virtualedit=onemore        " 行末の1文字先までカーソルを移動できるように

" エラービープ音の全停止
set vb t_vb=
set noeb

" let no_buffers_menu=1
let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:cpp_class_scope_highlight = 1

" markdownのハイライトを有効にする
set syntax=markdown

" set Ricty font for devicons
set gfn=RictyDiminished\ Nerd\ Font\ Complete\ Windows\ Compatible\ for\ Powerline:h14

" termguicolorsを設定するとterminal colorが変わるので設定し直す
" Neovim terminal colours for molokai
if has("nvim")
  let g:terminal_color_0 =  "#171717"
  let g:terminal_color_1 =  "#fe4386"
  let g:terminal_color_2 =  "#a6e32d"
  let g:terminal_color_3 =  "#e6da73"
  let g:terminal_color_4 =  "#0094d9"
  let g:terminal_color_5 =  "#9b37ff"
  let g:terminal_color_6 =  "#50b7d9"
  let g:terminal_color_7 =  "#c7c7c7"
  let g:terminal_color_8 =  "#686868"
  let g:terminal_color_9 =  "#fa80ac"
  let g:terminal_color_10 = "#bde371"
  let g:terminal_color_11 = "#fff27f"
  let g:terminal_color_12 = "#00beff"
  let g:terminal_color_13 = "#be9eff"
  let g:terminal_color_14 = "#5ed7ff"
  let g:terminal_color_15 = "#ffffff"
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_5
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
endif

"-----------------
" GUI settings
"-----------------
if has("gui_running")
  set guioptions=egmrti
  " Disable the blinking cursor.
  set gcr=a:blinkon0
  set background=dark
  if has("gui_mac") || has("gui_macvim")
    "     set guifont=Menlo:h12
    set transparency=15
  endif
else
  let g:CSApprox_loaded = 1
endif

