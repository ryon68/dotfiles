" mapping
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

" open down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" set history directly
let g:fzf_history_dir = '~/.local/share/nvim/fzf-history'

let $FZF_DEFAULT_OPTS = '--reverse --multi --bind ctrl-a:select-all'

command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" keymap
nno [Fzf] <Nop>
nmap <Leader>f [Fzf]
" ? でプレビュー表示
com! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>,
      \   <bang>0 ? fzf#vim#with_preview({'options': '-e'})
      \           : fzf#vim#with_preview('right:50%:hidden', '?')
      \   <bang>)
nno [Fzf]f :<C-u>Files<Space>
nno <silent>[Fzf]u :<C-u>History<CR>
nno <silent>[Fzf]b :<C-u>Buffers<CR>
" ripgrep
" ? でプレビュー表示
com! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg -uu --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview({'options': '-e'})
      \           : fzf#vim#with_preview('right:50%:hidden', '?')
      \   <bang>)
nno [Fzf]r :<C-u>Rg<Space>
" rg word
nno <silent>[Fzf]w *"zyiw:<C-u>Rg <C-r>z<CR>
" command history
nno <silent>[Fzf]: :<C-u>History:<CR>
" search history
nno <silent>[Fzf]/ :<C-u>History/<CR>
" map
nno <silent>[Fzf]m :<c-u>call fzf#vim#maps('', 0)<cr>
nno <silent><C-f>m :<c-u>call fzf#vim#maps('n', 0)<cr>
ino <silent><C-f>m <c-o>:call fzf#vim#maps('i', 0)<cr>
xno <silent><C-f>m :<c-u>call fzf#vim#maps('x', 0)<cr>
ono <silent><C-f>m <c-c>:<c-u>call fzf#vim#maps('o', 0)<cr>
" search helps
nno <silent>[Fzf]h :<C-u>Helptags<CR>
" locate
nno <silent>[Fzf]l :<C-u>Locate<Space>
" git
nno <silent>[Fzf]g :<C-u>GFiles<CR>
nno <silent>[Fzf]G :<C-u>GFiles?<CR>

