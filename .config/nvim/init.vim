" vim inititial setting file
"--------------------------------------------------

"--------------------------------------------------

" vi互換無効化
if &compatible
  set nocompatible
endif

"--------------------------------------------------
" Reset augroup
"--------------------------------------------------
augroup MyAutoCmd
  autocmd!
augroup END

"--------------------------------------------------
" Env settings
"--------------------------------------------------
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

" XDG base direcory compartible
let g:dein#cache_directory = $CACHE . '/dein'
" let g:dein#cache_directory = $HOME . '/.cache/dein'

" python3
" let g:python_host_prog = '/opt/local/bin/python2.7'
let g:python3_host_prog = '/opt/local/bin/python3.6'

" let g:vim_bootstrap_langs = "c,python"
" let g:vim_bootstrap_editor = "nvim"    " nvim or vim

"--------------------------------------------------
" Load rc files
"--------------------------------------------------
let s:rc_dir = '$CONFIG/nvim/userautoload/rc'

if has('nvim')
  runtime! userautoload/rc/*.vim
  "execute 'source $HOME/.config/nvim/userautoload/rc/option.vim'
  " load devine files
else
  fun! s:load_rc(file)
    let s:rc_file = expand(s:rc_dir . '/' . a:file . '.vim')
    if filereadable(s:rc_file)
      exe 'source ' s:rc_file
    endif
  endf

  call s:load_rc('option')
  call s:load_rc('func')
  call s:load_rc('autocmd')
  call s:load_rc('keymap')
  call s:load_rc('visual')
endif
"--------------------------------------------------
" dein settings
"--------------------------------------------------

""{{{ dein settings
" set dein directories
let s:dein_dir = expand('$CONFIG/nvim/dein')

" set runtimepath+=$CONFIG/nvim/dein/repos/github.com/Shougo/dein.vim
" let &runtimepath = s:repo_dir .",". &runtimepath
" let s:repo_dir = finddir('dein.vim', '.;')
" if s:repo_dir != '' || &runtimepath !~ '/dein.vim'
" if s:repo_dir == '' && &runtimepath !~ '/dein.vim'
let s:repo_dir = s:dein_dir
      \. '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:repo_dir
  endif
  execute 'set runtimepath^=' .
        \ fnamemodify(s:repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)

  " let g:dein#enable_notification = 1

  ""{{{ dein begin
  call dein#begin(s:dein_dir)

  " set toml directories
  let s:toml_dir = expand('$CONFIG/nvim/userautoload/toml')
  let s:plugins_toml = s:toml_dir . '/plugins.toml'
  let s:lazy_toml    = s:toml_dir . '/lazy.toml'
  let s:python_toml  = s:toml_dir . '/python.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:plugins_toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1}) " 遅延ロード
  " if has('python3')
  "   call dein#load_toml(s:python_toml, {'lazy': 1}) " 遅延ロード
  " endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" vimprocだけは最初にインストールしてほしい
" if dein#check_install(['vimproc'])
"   call dein#install(['vimproc'])
" endif

" If you want to install not installed plugins on startup.
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

""}}} End dein Scripts
