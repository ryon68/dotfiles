" tagbar settings

let g:tagbar_autofocus = 1
let g:tagbar_width = 30
let g:tagbar_autoshowtag = 1

let g:tagbar_ctags_bin = '/opt/local/bin/ctags'

let g:tagbar_map_togglesort = 'S'

" keymap
nno <silent><C-b> :<C-u>TagbarToggle<CR>
