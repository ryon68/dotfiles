"=========
"NERDTree
"=========
" Bookmark表示
let NERDTreeShowBookmarks=1

" ディレクトリ表示の設定
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 20
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

let g:NERDTreeLimitedSyntax = 1
" NERDTress File highlighting

" nno <silent><C-n> :<C-u>NERDTreeToggle<CR>
nno <silent><C-n> :<C-u>NERDTreeTabsToggle<CR>

" close nerdtree together
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter *
      \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

