"==================
"denite add rcdile
"==================

" let g:webdevicons_enable_denite = 1

"===============
" key mapping
"===============
" prefix
no [denite] <Nop>
map <Leader>d [denite]

" menu
" nno <silent> [denite]m :<C-u>Denite menu:
" search file in the current directory
nno  [denite]f :<C-u>Denite file_rec -path=
" " search file old
nno <silent> [denite]o :<C-u>Denite file_old <CR>
" " search buffer
nno <silent> [denite]b :<C-u>Denite buffer <CR>
" " search class/function
nno <silent> [denite]c :<C-u>Denite outline <CR>
" " search filetype
nno <silent> [denite]t :<C-u>Denite filetype <CR>
" " search most recently used file
nno <silent> [denite]u :<C-u>Denite file_mru <CR>
" " help search
nno <silent> [denite]h :<C-u>Denite help <CR>
nno <silent> [denite]hw :<C-u>DeniteCursorWord help <CR>
" " grep
nno <silent> [denite]g :<C-u>Denite -buffer-name=search -no-empty -mode=normal grep<CR>
" " word grep
nno <silent> [denite]gw :<C-u>DeniteCursorWord grep -buffer-name=search -mode=normal line<CR><C-R><C-W><CR>
" " plugin list
nno <silent> [denite]l :<C-u>Denite dein<CR>
" " jump list for changed
nno <silent> [denite]k :<C-u>Denite -mode=normal change jump<CR>
" " ghq
" nnoremap <silent> [Denite]g :<C-u>Denite ghq<CR>


" search yank history
nnoremap <silent> [denite]y
      \ :<C-u>Denite -buffer-name=register
      \ register neoyank<CR>
xnoremap <silent> [denite]y
      \ :<C-u>Denite -default-action=replace -buffer-name=register
      \ register neoyank<CR>

nnoremap <silent>  [denite]rc
      \ :<C-u>Denite file/rec:~/.config/nvim/userautoload/rc<CR>

nnoremap <silent> [denite]/ :<C-u>Denite -buffer-name=search -auto-highlight
      \ line<CR>
nnoremap <silent> [denite]* :<C-u>DeniteCursorWord -buffer-name=search
      \ -auto-highlight -mode=normal line<CR>

nnoremap <silent> [denite]s :<C-u>Denite file/point file/old file_mru
      \ -sorters=sorter/rank
      \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`
      \ file file:new<CR>

nnoremap <silent><expr> [denite]t  &filetype == 'help' ?  "g\<C-]>" :
      \ ":\<C-u>DeniteCursorWord -buffer-name=tag -immediately
      \  tag:include\<CR>"
nnoremap <expr> [denite]p  &filetype == 'help' ?
      \ ":\<C-u>pop\<CR>" : ":\<C-u>Denite -mode=normal jump\<CR>"

nnoremap <silent> [denite]n :<C-u>Denite -buffer-name=search
      \ -resume -mode=normal -refresh<CR>
nnoremap <silent> [denite]:
      \ :<C-u>Denite command_history command<CR>

