"==================
"denite add rcdile
"==================

" let g:webdevicons_enable_denite = 1

"===============
" key mapping
"===============
"prefix"
no [denite] <Nop>
map <Leader>d [denite]

" menu
" nno <silent> [denite]m :<C-u>Denite menu:
" search file in the current directory
nno  [denite]f :<C-u>Denite file_rec -highlight-mode-insert=Search -path=
" search file old
nno <silent> [denite]o :<C-u>Denite file_old -highlight-mode-insert=Search<CR>
" search buffer
nno <silent> [denite]b :<C-u>Denite buffer -highlight-mode-insert=Search<CR>
" search class/function
nno <silent> [denite]c :<C-u>Denite outline -highlight-mode-insert=Search<CR>
" search filetype
nno <silent> [denite]t :<C-u>Denite filetype -highlight-mode-insert=Search<CR>
" search most recently used file
nno <silent> [denite]u :<C-u>Denite file_mru -highlight-mode-insert=Search<CR>
" search yank history
" nno <silent> [denite]y :<C-u>Denite neoyank -highlight-mode-insert=Search<CR>
" help search
nno <silent> [denite]h :<C-u>Denite help -highlight-mode-insert=Search<CR>
nno <silent> [denite]hw :<C-u>DeniteCursorWord help -highlight-mode-insert=Search<CR>
" grep
nno <silent> [denite]g :<C-u>Denite -buffer-name=search -no-empty -auto-resize -mode=normal grep<CR>
" word grep
nno <silent> [denite]gw :<C-u>DeniteCursorWord grep -buffer-name=search -auto-highlight -mode=normal -auto-resize line<CR><C-R><C-W><CR>
" plugin list
nno <silent> [denite]p :<C-u>Denite dein<CR>
" jump list for changed
nno <silent> [denite]l :<C-u>Denite -mode=normal change jump<CR>

