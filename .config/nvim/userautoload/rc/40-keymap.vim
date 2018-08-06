"================
" Key-Mappings
"================

let mapleader = "\<Space>"  " Leader -> Space

" s 無効化
no s <Nop>

" write, quit
nno <Leader>w :<C-u>w<CR><Esc>
nno <Leader>q :<C-u>q<CR><Esc>
" lead settings
nno <Leader>l :<C-u>source ~/.config/nvim/init.vim<CR>:call BGTransparency()<CR>
" lead changing
nno <Leader>r :<C-u>e!<CR>
" all indent
nno == gg=G''

" yank, paste
vno <silent> y y`]
vno <silent> p p`]
nno <silent> p p`]
" delete without yank
nno x "_x
vno x "_x
nno X "_X
vno X "_X
" paste in v mode
vno <expr> p 'pgv"'.v:register.'y`>'

" カーソル移動
no j gj
no k gk
no gj j
no gk k
no m  %
no <S-h> ^
no <S-j> }
no <S-k> {
no <S-l> $
ino <C-h> <Left>
ino <C-j> <Down>
ino <C-k> <Up>
ino <C-l> <Right>
" Enter,Backspace,Delete
nno <CR> G
" nno <BS> x<Left>
nno <BS> gg
ino <C-d> <Del>
imap <C-b> <BS>

" exit insert mode
ino <ESC> <C-\><C-n>
" command mode
nno ; :
nno : ;
vno ; :
vno : ;
" command line using emacs key-bind
cno <C-p> <Up>
cno <C-n> <Down>
cno <C-b> <Left>
cno <C-f> <Right>
cno <C-a> <Home>
cno <C-e> <End>
cno <C-d> <Del>

" 画面分割
nno <silent>ss :<C-u>split<CR><C-w>j
nno <silent>sv :<C-u>vsplit<CR><C-w>l
nno <silent>sj <C-w>j
nno <silent>sk <C-w>k
nno <silent>sl <C-w>l
nno <silent>sh <C-w>h
nno <silent>s<down> <C-w>j
nno <silent>s<up> <C-w>k
nno <silent>s<right> <C-w>l
nno <silent>s<left> <C-w>h
nno <silent>sJ <C-w>J
nno <silent>sK <C-w>K
nno <silent>sL <C-w>L
nno <silent>sH <C-w>H
nno <silent>s0 <C-w>=

" 改行
if !has('gui_running')
  " CUIで入力された<S-CR>,<C-S-CR>が拾えないので
  " iTerm2のキー設定を利用して特定の文字入力をmapする
  map ✠ <S-CR>
  imap ✠ <S-CR>
  map ✢ <C-S-CR>
  imap ✢ <C-S-CR>
endif
imap <S-CR> <End><CR>
imap <C-S-CR> <Up><End><CR>
nno <S-CR> mzo<ESC>`z
nno <C-S-CR> mzO<ESC>`z

" move line
nno <M-k> "zdd<Up>"zP
nno <M-j> "zdd"zp
" move lines
vno <M-k> "zx<Up>"zP`[V`]
vno <M-j> "zx"zp`[V`]

"  tab
no <silent>tn :<C-u>tabnew<CR>
no <silent>th gt
no <silent>tl gT

" Buffer
nno <silent>>  :<C-u>bn<CR>
nno <silent><  :<C-u>bp<CR>
nno <silent>bd :<C-u>bd<CR>
nno <silent>bl :<C-u>buffers<CR>

" explorer
nno <silent><Leader>e :Ve<CR>

" highlight search
nno <silent>* "zyiw:let @/ = '\<' . @z . '\>'<CR>:call histadd('/',@z)<CR>:set hlsearch<CR>
nmap # *;%s;<C-r>z;
vno <silent> * mz:call <SID>set_vsearch()<CR>:set hlsearch<CR>`z
" xno * :<C-u>call <SID>set_vsearch()<CR>/<C-r>/<CR>
vmap # *;%s;<C-r>z;
function! s:set_vsearch()
  silent normal gv"zy
  let @/ = '\V' . substitute(escape(@z, '/\'), '\n', '\\n', 'g')
  call histadd('/',@z)
endfunction
nno <silent><ESC><ESC><ESC> :<C-u>nohlsearch<CR><Esc><C-l>
nno <silent><C-l> :<C-u>nohlsearch<CR><Esc><C-l>

" typo
nno <C-p> <Esc><Left>"zx"zp
" ino <C-p> <Esc><Left>"zx"zpa

" tagjump
" nno <Leader>] :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" nno <Leader>[ :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nno <Leader>] :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" nno <Leader>[ :split<CR> :exe("tjump ".expand('<cword>'))<CR>

"--------------------------------
" original command and plugins
"--------------------------------
" nno <silent><C-p> :<C-u>Pyplot<CR>
" nno <silent>ma    :<C-u>Make 20 all<CR>
" nno <silent>mr    :<C-u>Make 20 build run<CR>
" nno <silent><C-g> :<C-u>Gnuplot<CR>
" nno <leader>r     :<C-u>RangerChooser<CR>

" Google
nno  gw :Google <C-R><C-W><CR>

"--------------------
" Abbreviations
"--------------------
" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

