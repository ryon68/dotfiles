"===========
"deoplete
"===========

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 100

" Use smartcase.
" call deoplete#custom#option('smart_case', v:true)

"----------------
" key-mappings
"----------------
" TABで補完候補を移動
" ino <expr><tab> pumvisible() ? "\<C-n>" :
"       \ neosnippet#expandable_or_jumpable() ?
"       \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>""

" TABで補完候補を移動
" ino <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ deoplete#mappings#manual_complete()
" func! s:check_back_space() abort "{{{
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endf"}}}

" <C-h>, <BS>: close popup and delete backword char.
" ino <expr><C-h> deoplete#close_popup()."\<C-h>"
ino <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
" ino <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endf
