" :Tnew の場合に挿入モードで開始する
let g:neoterm_autoinsert = 1
" :T {cmd} 実行時に画面スクロールをする
let g:neoterm_autoscroll = 1
" 縦分割する
" let g:neoterm_default_mod='vertical'
" 横分割する
let g:neoterm_default_mod='belowright'
let g:neoterm_size =  '15'

"
let g:neoterm_keep_term_open = 0

"-----------
" keymap
"-----------
" prefix
no [neoterm] <Nop>
map <Leader>t [neoterm]

" :Tnew 実行
nno <silent> [neoterm]t :Tnew<CR>
" :Tnew 実行(縦分割)
nno <silent> [neoterm]v :vertical Tnew<CR>
" ノーマルモードで現在のカーソルを実行
nno <silent> [neoterm]e :TREPLSendLine<CR>
" ビジュアルモード
vno <silent> [neoterm]e :TREPLSendSelection<CR>
" ファイル送信
nno <silent> [neoterm]f :TREPLSendFile<CR>

" exit term mode
tno <silent> <ESC> <C-\><C-n>
" exit terminal
tno <silent><C-d> <C-\><C-n>:Tclose<CR>
" tno <silent><C-g> <C-\><C-n>:Tclose<CR>
" nno <silent><C-c> <C-\><C-n>:Tclose<CR>

tno <silent><C-x> <C-\><C-n><C-w>k
