"=================
" My-Functions
"=================

fun! s:dark(scheme)
  "--- select background dark/light
  set background=dark
  "--- colorscheme select
  if a:scheme == 'molokai'
    "--- molokai
    colors molokai
    "{{{ color settings for molokai
    " hi endofbuffer ctermbg=none guibg=none
    hi visual guibg=#3e4452
    hi matchparen guibg=#e6da73
    hi vertsplit guibg=none
    hi gitgutteradddefault guibg=none
    hi gitgutterchangedefault guibg=none
    hi gitgutterdeletedefault guibg=none
    hi gitgutteraddinvisible guibg=none
    hi gitgutterchangeinvisible guibg=none
    hi gitgutterdeleteinvisible guibg=none
    "}}}
  elseif a:scheme == 'iceberg'
    "--- iceberg
    colors iceberg
  elseif a:scheme == 'snow'
    "--- snow
    colors snow
  elseif a:scheme == 'japanesque'
    "--- japanesque
    colors japanesque
  endif
  call BGTransparency()
endf
fun! s:light(scheme)
  "--- select background dark/light
  set background=light
  "--- colorscheme select
  if a:scheme == 'pencil'
    "--- pencil
    colors pencil
    " "{{{ color settings for pencil
    hi clear linenr
    hi link LineNr Normal
    " "}}}
  elseif a:scheme == 'snow'
    "--- snow
    colors snow
  endif
endf

fun! SelectColorScheme(background,scheme)
  if a:background == 'dark'
    if a:scheme == 'molokai'
      autocmd VimEnter * nested call s:dark('molokai')
      let g:airline_theme = 'deus'
    elseif a:scheme == 'iceberg'
      autocmd VimEnter * nested call s:dark('iceberg')
      let g:airline_theme = 'papercolor'
    elseif a:scheme == 'japanesque'
      autocmd VimEnter * nested call s:dark('japanesque')
      let g:airline_theme = 'bubblegum'
    elseif a:scheme == 'snow'
      autocmd VimEnter * nested call s:dark('snow')
      let g:airline_theme = 'papercolor'
    endif
  elseif a:background == 'light'
    if a:scheme == 'pencil'
      autocmd VimEnter * nested call s:light('pencil')
      let g:airline_theme = 'papercolor'
    elseif a:scheme == 'snow'
      autocmd VimEnter * nested call s:light('snow')
      let g:airline_theme = 'papercolor'
    endif
  endif
endf
com! -nargs=* SelectColorScheme call SelectColorScheme(<f-args>)

fun! BGTransparency()
  hi normal ctermbg=none guibg=none
  hi nontext ctermbg=none guibg=none
  hi linenr ctermbg=none guibg=none
  hi specialkey ctermbg=none guibg=none
endf

fun! Google(...)
  let l:cmd = "!open -a Google\\ Chrome \'http://www.google.co.jp/"
  let l:opt = "search?num=100"
  let l:wrd = ""
  if a:0 >= 1
    for i in a:000
      if i == a:1
        let l:wrd = i
      else
        let l:wrd = l:wrd."+".i
      endif
    endfor
    let l:opt = l:opt."&q=".l:wrd
    let l:cmd = l:cmd.l:opt
  endif
  let l:cmd = l:cmd."\'"
  exe l:cmd
endf
command! -nargs=* Google call Google(<f-args>)


fun! CMake(windowwidth, ...)
  let l:command = "cmake"
  if a:0 > 0
    for i in a:000
      let l:tmp     = " ".i
      let l:command = l:command.l:tmp
    endfor
  endif
  if a:windowwidth == 0
    let l:windowwidth = 10
  else
    let l:windowwidth = a:windowwidth
  endif
  if findfile("CMakeLists.txt",getcwd()) != "" || findfile("Makefile",getcwd()) != ""
    call BeginTerminal(l:windowwidth, l:command)
  elseif findfile("CMakeLists.txt",getcwd()."/../") != "" || findfile("Makefile",getcwd()."/../") != ""
    cd ../
    call BeginTerminal(l:windowwidth, l:command)
    cd -
  else
    echo "CMakeListが存在しません."
  endif
endf
command! -count -nargs=* CMake call CMake(<count>, <f-args>)

fun! Make(windowwidth, ...)
  let l:command = "make"
  if a:0 > 0
    for i in a:000
      let l:tmp     = " ".i
      let l:command = l:command.l:tmp
    endfor
  endif
  if a:windowwidth == 0
    let l:windowwidth = 10
  else
    let l:windowwidth = a:windowwidth
  endif
  if findfile("GNUmakefile",getcwd()) != "" || findfile("Makefile",getcwd()) != ""
    call BeginTerminal(l:windowwidth, l:command)
  elseif findfile("GNUmakefile",getcwd()."/../") != "" || findfile("Makefile",getcwd()."/../") != ""
    cd ../
    call BeginTerminal(l:windowwidth, l:command)
    cd -
  else
    echo "Makefileが存在しません."
  endif
endf
command! -count -nargs=* Make call Make(<count>, <f-args>)


fun! Pyplot(...)
  if expand("%:e") == "txt"
    if a:0 == 0
      let l:column = " -u1"
    elseif a:0 == 1
      let l:column = " -u".a:1
    elseif a:0 >= 2
      let l:column = " -n".a:0
      for i in a:000
        let l:tmp  = " -u".i
        let l:column = l:column.l:tmp
      endfor
    endif
    exe ":!pyplot %".l:column
  endif
endf
command! -nargs=* Pyplot call Pyplot(<f-args>)


fun! Gnuplot()
  if expand("%".":e") == "gp" || expand("%".":e") == "gpi"
    let l:command = "gnuplot ".expand("%")
    call BeginTerminal(5, l:command)
    starti
  else
    echo "invalid file type."
  endif
endf
command! -nargs=* Gnuplot call Gnuplot(<f-args>)


if executable('pdftotext')
  command! -complete=file -nargs=1 Pdf :r !pdftotext -nopgbrk -layout <q-args> -
endif


fun! Tex()
  if expand("%:e") == "tex"
    let l:command = ":!platex ".expand("%")
    let command = command.">& /dev/null && "
    let l:dvi = expand("%:r").".dvi"
    if findfile(dvi,getcwd()) != ""
      let command = command."open -a Skim "
      exe command.dvi
    endif
    let l:aux = expand("%:r").".aux"
    let l:log = expand("%:r").".log"
    if findfile(aux,getcwd()) != ""
      call delete(aux)
    endif
    if findfile(log,getcwd()) != ""
      call delete(log)
    endif
  else
    echo "invalid file type."
  endif
endf
command! Tex call Tex()


" fun! RangeChooser()
"     let temp = tempname()
"     " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
"     " with ranger 1.4.2 through 1.5.0 instead.
"     "exec 'silent !ranger --choosefile=' . shellescape(temp)
"     if has("gui_running")
"         exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
"     else
"         exec 'silent !ranger --choosefiles=' . shellescape(temp)
"     endif
"     if !filereadable(temp)
"         redraw!
"         " Nothing to read.
"         return
"     endif
"     let names = readfile(temp)
"     if empty(names)
"         redraw!
"         " Nothing to open.
"         return
"     endif
"     " Edit the first item.
"     exec 'edit ' . fnameescape(names[0])
"     " Add any remaning items to the arg list/buffer list.
"     for name in names[1:]
"         exec 'argadd ' . fnameescape(name)
"     endfor
"     redraw!
" endf
" command! -bar RangerChooser call RangeChooser()

