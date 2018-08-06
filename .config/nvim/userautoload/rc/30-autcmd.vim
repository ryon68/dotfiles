"====================
" Autocmd Rules
"====================

" autocommentout off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=ro
augroup END

" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" fzf & ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" set shebbang
" augroup SetShebang
"   autocmd! SetShebang
"   autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\n# -*- coding: utf-8 -*-\"|$
"   autocmd BufNewFile *.sh 0put =\"#!/bin/sh \"|$
" augroup END

" 行末空白削除
if &ft != 'markdown'
  autocmd BufWritePre *.{c,h,cpp,cc,py,pl,vim,toml} :%s/\s\+$//e
endif

augroup geant-format
  autocmd!
  au BufRead,BufNewFile *.{cc,hh} exe 'source ~/.config/nvim/after/indent/cc.vim'
augroup END

