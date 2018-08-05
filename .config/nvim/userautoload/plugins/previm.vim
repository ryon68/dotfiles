" preVim
" nno <Leader>p :<C-u>PrevimOpen<CR>
nnoremap [previm] <Nop>
nmap <Leader>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>
