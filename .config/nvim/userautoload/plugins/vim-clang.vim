"=========
"vim-clang
"=========

" library path
let g:deoplete#sources#clang#libclang_path = '/opt/local/libexec/llvm-5.0/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/opt/local/libexec/llvm-6.0/lib/clang/'

" disable auto completion for vim-clanG
let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1

" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

let g:clang_exec = 'clang'
let g:clang_format_exec = 'clang-format'

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '
  \ -std=c++1z
  \ -stdlib=libc++
  \ -pedantic-errors
  \ '

