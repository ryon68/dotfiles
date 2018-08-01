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
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }

let g:quickrun_no_default_key_mappings = 1
nno <silent>\r :<C-u>QuickRun -mode n<CR>
xno <silent>\r :<C-u>QuickRun -mode v<CR>
