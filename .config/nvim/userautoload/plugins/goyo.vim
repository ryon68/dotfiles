let g:goyo_width=120  "(default: 80)
let g:goyo_height="90%"  "(default: 85%)
let g:goyo_linenr=0   "(default: 0)

fun! s:goyo_enter()
  " silent !tmux set status off
  " silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  setl noshowmode noshowcmd
  setl scrolloff=999
  setl background=light
  colors solarized8
  " colors snow
  " colors pencil
  Limelight 0.3
endf
fun! s:goyo_leave()
  " silent !tmux set status on
  " silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  colors molokai
  setl showmode showcmd
  setl scrolloff=3
  setl background=dark
  "{{{ color settings for molokai
  hi visual guibg=#3e4452
  hi matchparen guibg=#e6da73
  hi vertsplit guibg=none
  hi gitgutteradddefault guibg=none
  hi gitgutterchangedefault guibg=none
  hi gitgutterdeletedefault guibg=none
  hi gitgutteraddinvisible guibg=none
  hi gitgutterchangeinvisible guibg=none
  hi gitgutterdeleteinvisible guibg=none
  "}}}
  let g:airline_theme = 'deus'
  Limelight!
  call BGTransparency()
endf
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nno <silent>\p :Goyo<CR>
