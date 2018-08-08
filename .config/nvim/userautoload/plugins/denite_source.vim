"==================
"denite source rcdile
"==================

" プロンプトを指定
" call denite#custom#option('default', 'prompt', '>')
" call denite#custom#option('default', 'short_source_names', v:true)
call denite#custom#option('default', {
      \ 'auto_accel': v:true,
      \ 'prompt': '>',
      \ 'source_names': 'short',
      \ })

" rg command on grep source
if executable('rg')
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  " call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
else
  call denite#custom#var('file/rec', 'command',
        \ ['grep'])
  " \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

" 検索対象外のファイル指定
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" file_rec検索時にfuzzymatchを有効にし、検索対象から指定のファイルを除外
call denite#custom#source(
      \ 'file/rec, file/old', 'matchers',
      \ ['matcher/fuzzy', 'matcher/project_files', 'matcher/ignore_globs'])
if has('nvim')
call denite#custom#source('grep', 'matchers',
        \ ['matcher/cpsm'])
        " \ ['matcher/fuzzy'])
endif

call denite#custom#source('tag', 'matchers', ['matcher/substring'])
call denite#custom#source('file/old', 'converters',
      \ ['converter/relative_word'])

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

"--------------------------
" key mappings for denite
"--------------------------
" change mode
call denite#custom#map('normal', 'i',
      \ '<denite:enter_mode:insert>', 'noremap')
call denite#custom#map('insert', '<C-[>',
      \ '<denite:enter_mode:normal>', 'noremap')
" exit denite
call denite#custom#map('insert', '<C-d>',
      \ '<denite:quit>', 'noremap')
call denite#custom#map('insert', '<C-g>',
      \ '<denite:quit>', 'noremap')
" move line
call denite#custom#map('normal', '<C-j>',
      \ '<denite:move_to_next_line>')
call denite#custom#map('normal', '<C-k>',
      \ '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-j>',
      \ '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-k>',
      \ '<denite:move_to_previous_line>')
" move text
call denite#custom#map('insert', '<C-n>',
      \ '<denite:assign_next_text>')
call denite#custom#map('insert', '<C-p>',
      \ '<denite:assign_previous_text>')
" split open
call denite#custom#map('insert', '<C-s>',
      \ '<denite:do_action:split>')
" vsplit open
call denite#custom#map('insert', '<C-v>',
      \ '<denite:do_action:vsplit>')
" tab open
call denite#custom#map('insert', '<C-t>',
      \ '<denite:do_action:tabopen>')
" matcher
call denite#custom#map('insert', '<C-r>',
      \ '<denite:toggle_matchers:matcher/substring>', 'noremap')
" sort
call denite#custom#map('insert', '<C-x>',
      \ '<denite:change_sorters:sorter/reverse>', 'noremap')
" quickfix
call denite#custom#map('normal', 'r',
      \ '<denite:do_action:quickfix>', 'noremap')
" expr
call denite#custom#map('insert', ';',
      \ 'vimrc#sticky_func()', 'expr')

call denite#custom#map('insert', '<BS>',
      \ '<denite:smart_delete_char_before_caret>', 'noremap')
call denite#custom#map('insert', '<C-h>',
      \ '<denite:smart_delete_char_before_caret>', 'noremap')


" Add custom menu
" let s:menus = {}
" let s:menus_file = {'description': 'File search (buffer, file, file_rec, file_mru)'}
" let s:menus_line = {'description': 'Line search (change, grep, line, tag)'}
" let s:menus_others = {'description': 'Others (command, command_history, help)'}
" let s:menus_file_command_candidates = [
"       \ ['buffer', 'Denite buffer'],
"       \ ['file: Files in the current directory', 'Denite file'],
"       \ ['file_rec: Files, recursive list under the current directory', 'Denite file_rec'],
"       \ ['file_mru: Most recently used files', 'Denite file_mru']
"       \ ]
" let s:menus_line_command_candidates = [
"       \ ['change', 'Denite change'],
"       \ ['grep :grep', 'Denite grep'],
"       \ ['line', 'Denite line'],
"       \ ['tag', 'Denite tag']
"       \ ]
" let s:menus_others_command_candidates = [
"       \ ['command', 'Denite command'],
"       \ ['command_history', 'Denite command_history'],
"       \ ['help', 'Denite help']
"       \ ]
"
" call denite#custom#var('menu', 'menus', s:menus)
