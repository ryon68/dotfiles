" tcommentで使用する形式を追加
if !exists('g:tcomment_types')
  let g:tcomment_types = {}
endif
let g:tcomment_types = {
      \'php_surround' : "<?php %s ?>",
      \'eruby_surround' : "<%% %s %%>",
      \'eruby_surround_minus' : "<%% %s -%%>",
      \'eruby_surround_equality' : "<%%= %s %%>",
\}

" マッピングを追加
nno <silent>_     :TComment<CR>
vno <silent>_     :TComment<CR>

nno <c-_><space> :TComment
vno <c-_><space> :TComment
nno <c-_>b       :TCommentBlock
vno <c-_>b       :TCommentBlock
nno <c-_>a       :TCommentAs
vno <c-_>a       :TCommentAs
nno <c-_>n       :TCommentAs &filetype <QUERY COUNT>
vno <c-_>n       :TCommentAs &filetype <QUERY COUNT>
nno <c-_>s       :TCommentAs &filetype_<QUERY COMMENT SUBTYPE>
vno <c-_>s       :TCommentAs &filetype_<QUERY COMMENT SUBTYPE>
nno <c-_>i       :TCommentInline
vno <c-_>i       :TCommentInline
nno <c-_>r       :TCommentRight
vno <c-_>r       :TCommentRight

function! SetErubyMapping2()
  nmap <buffer> <C-_>c ;TCommentAs eruby_surround<CR>
  nmap <buffer> <C-_>- ;TCommentAs eruby_surround_minus<CR>
  nmap <buffer> <C-_>= ;TCommentAs eruby_surround_equality<CR>

  vmap <buffer> <C-_>c ;TCommentAs eruby_surround<CR>
  vmap <buffer> <C-_>- ;TCommentAs eruby_surround_minus<CR>
  vmap <buffer> <C-_>= ;TCommentAs eruby_surround_equality<CR>
endfunction

" erubyのときだけ設定を追加
au FileType eruby call SetErubyMapping2()
" phpのときだけ設定を追加
au FileType php nmap <buffer><C-_>c ;TCommentAs php_surround<CR>
au FileType php vmap <buffer><C-_>c ;TCommentAs php_surround<CR>
