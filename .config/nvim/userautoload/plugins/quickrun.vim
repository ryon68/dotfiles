"=========
" quickrun
"=========

" quickrun_configの初期化
if !exists('g:quickrun_config')
  let g:quickrun_config =   {}
endif

let g:quickrun_config['_'] = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ "outputter/buffer/split" : ":rightbelow 8sp",
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }
      " \ "outputter/buffer/split" : "vertical 30sp",

let g:quickrun_config.cpp = {
      \   'command': 'g++',
      \   'cmdopt': '-std=c++11',
      \ }
      " \   'args': '%{input("argv> ")}',
let g:quickrun_config['c'] = {
      \ 'type': 'c/gcc',
      \ 'command': 'gcc',
      \ 'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
      \ 'tempfile': '%{tempname()}.c',
      \ 'hook/sweep/files': '%S:p:r',
      \ 'cmdopt': '-std=c99 -Wall',
      \ }
      " \ 'args': '%{input("argv> ")}',

let g:quickrun_config.markdown = {
      \ 'type': 'markdown/pandoc',
      \ 'cmdopt': '-s',
      \ 'outputter': 'browser',
      \ 'args': '--mathjax',
      \ }

let g:quickrun_no_default_key_mappings = 1
" nno <silent>\r :<C-u>QuickRun -mode n<CR>
" xno <silent>\r :<C-u>QuickRun -mode v<CR>
nno \r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
xno \r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
