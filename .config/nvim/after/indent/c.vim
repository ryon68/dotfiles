setl path+=/opt/local/include/gcc/c++
setl path+=/opt/local/include/boost
setl tags+=~/cpp.tags
setl tabstop=4
setl shiftwidth=4
setl noexpandtab
setl matchpairs+=<:>
" 最後に定義された include 箇所へ移動してを挿入モードへ
nno<buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o
" BOOST_PP_XXX 等のハイライトを行う
" syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
" highlight link boost_pp cppStatement

" keymap
ino <buffer>{ {}<Left>
ino <buffer>{} {}
ino <buffer>{<CR> {}<Left><CR><ESC><S-o>
ino <buffer>( ()<Left>
ino <buffer>() ()
ino <buffer>' ''<Left>
ino <buffer>'' ''
ino <buffer>" ""<Left>
ino <buffer>"" ""
ino <buffer>[ []<Left>
ino <buffer>[] []
" ino <buffer>< <><Left>
" ino <buffer><> <>
ino <buffer>, ,<Space>
ino <C-s> std::
ino <C-x> boost::
" ino = <Space>=<Space>
" ino == ==

" 行末に ; を入力
ino <silent>,; <ESC>mzA;<Esc>`za
nno <silent>,;      mzA;<Esc>`z
ino <silent><C-Space> <Esc>mzA<Space><Space><Esc>`z<Right>i
nno <silent><C-Space> mzA<Space><Space><Esc>`z
" ino …        <ESC>:AppendChar ;<CR>i<Right>
" nno …             :AppendChar ;<CR>
