"=========
"vim-airline
"=========

" Powerline系フォントを利用する
let g:airline_powerline_fonts = 1

" let g:airline_theme='deus'
let g:airline#extensions#tagbar#enabled = 1

" tabline
" タブに表示する名前
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '0 ',
      \ '1': '1 ',
      \ '2': '2 ',
      \ '3': '3 ',
      \ '4': '4 ',
      \ '5': '5 ',
      \ '6': '6 ',
      \ '7': '7 ',
      \ '8': '8 ',
      \ '9': '9 '
      \}

"statusline
" let g:airline#extensions#default#layout = [
"       \ [ 'a', 'b', 'c' ],
"       \ [ 'x', 'y', 'z', 'error', 'warning']
"       \ ]
let g:airline_mode_map = {
      \ '__' : '------',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'V-L',
      \ 'c'  : 'C',
      \ '' : 'V-B',
      \ 's'  : 'S',
      \ 'S'  : 'S-L',
      \ '' : 'S-B',
      \ 't'  : 'T',
      \}

" let g:airline#extensions#branch#enabled = 0
" let g:airline#extensions#hunks#enabled = 0
" let g:airline#extensions#whitespace#enabled = 0
" 選択行列の表示をカスタム(デフォルトだと長くて横幅を圧迫するので最小限に)
" let g:airline_section_b =
" \ ' %{airline#extensions#hunks#get_hunks()} %{airline#extensions#branch#get_head()}'
" let g:airline_section_c = '%< %f'
" let g:airline_section_x = '%{&filetype}'
let g:airline_section_z ='%3p%% %3l:%2v'
let g:airline_section_error = '%{airline#extensions#ale#get_error()}'
let g:airline_section_warning = ' %{airline#extensions#ale#get_warning()}'

" Lintツールによるエラー、警告を表示(ALEの拡張)
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '⨉ '
let g:airline#extensions#ale#warning_symbol = '⚠ '
