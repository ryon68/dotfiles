"=========
"ale
"=========
" エラー表示の列を常時表示
let g:ale_sign_column_always = 1

" エラー行に表示するマーク
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠ '

" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_echo_msg_format = '[%linter%]%code: %%s'''

"ファイルを開いた時に実行
let g:ale_lint_on_enter = 0
" 保存時に実行
let g:ale_lint_on_save = 1
" 編集中のlintはしない
let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_text_changed = 0

" エラーと警告がなくなっても開いたままにする
let g:ale_keep_list_window_open = 1

let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
highlight clear ALEErrorSign
highlight clear ALEWarningSign


"============
" options
"============
" 有効にするlinter
let g:ale_linters = {
      \ 'python': ['flake8'],
      \ 'cpp': ['clang', 'gcc'],
      \ 'cc': ['clang', 'gcc'],
      \ 'c': ['clang', 'gcc'],
      \ 'javascript': ['eslint'],
      \ 'zsh': ['shell']
      \}

" for clang
let g:ale_c_clang_executable = 'clang++'
let g:ale_c_clang_options = '-std=c++11 -Wall'
let g:ale_c_gcc_executable = 'gcc'
let g:ale_c_gcc_options = '-std=c++11 -Wall'
" let g:ale_c_clangtidy_checks = ['*']
" let g:ale_c_clangtidy_executable = 'clang-tidy'
" let g:ale_c_clangtidy_options = '-I../include'
" let g:ale_c_cppcheck_executable = 'cppcheck'
" let g:ale_c_cppcheck_options = '--enable=style'

let g:ale_cpp_clang_executable = 'clang++'
let g:ale_cpp_clang_options = '-std=c++14 -Wall'
let g:ale_cpp_gcc_executable = 'gcc'
let g:ale_cpp_gcc_options = '-std=c++14 -Wall'

"============
" keymap
"============
" prefix
no [ale] <Nop>
map <Leader>a [ale]
nno <silent> [ale]a :<C-u>ALELint<CR>
" エラー行にジャンプ
" nmap <silent><M-p> <Plug>(ale_previous)
" nmap <silent><M-n> <Plug>(ale_next)
nmap <silent>[ale]j <Plug>(ale_previous)
nmap <silent>[ale]k <Plug>(ale_next)

" lint結果をロケーションリストとQuickFixには表示しない
" 出てると結構うざいしQuickFixを書き換えられるのは困る
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 0
" let g:ale_open_list = 0
" let g:ale_keep_list_window_open = 0

" fix for codes
" let g:ale_fixers = {
"       \ 'javascript': ['prettier'],
"       \ 'python': ['autopep8', 'isort'],
"       \ 'markdown': [
"       \   {buffer, lines -> {'command': 'textlint -c ~/.config/textlintrc -o /dev/null --fix --no-color --quiet %t', 'read_temporary_file': 1}}
"       \   ],
"       \ }
" let g:ale_fix_on_save = 1

