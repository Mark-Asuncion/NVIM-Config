:set guicursor=i:block
:set rnu
:set scrolloff=10
:set incsearch
:set nohlsearch 
:set number
:set cursorline
:set cursorlineopt=number
" :set selection=exclusive
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set termguicolors
:set encoding=UTF-8

lua require('init')
" Themes
:let g:airline#extensions#tabline#enabled = 1
:let g:airline#extensions#tabline#left_sep = ' '
:let g:airline#extensions#tabline#left_alt_sep = '|'
:let g:airline#extensions#tabline#formatter = 'default'
:let g:airline_theme='deus'

" Airline Customizations
if !exists('g:airline_symbols')
    :let g:airline_symbols = {}
endif
:let g:airline_powerline_fonts = 1
:let g:airline_stl_path_style = 'short'
" :let g:airline_symbols.crypt = ' '

" powerline symbols
:let g:airline_left_sep = ''
:let g:airline_left_alt_sep = ''
:let g:airline_right_sep = ''
:let g:airline_right_alt_sep = ''
" :let g:airline_left_sep = ''
" :let g:airline_left_alt_sep = ''
" :let g:airline_right_sep = ''
" :let g:airline_right_alt_sep = ''
:let g:airline_symbols.branch = ''
:let g:airline_symbols.colnr = ' :'
:let g:airline_symbols.readonly = ''
:let g:airline_symbols.linenr = ' :'
:let g:airline_symbols.maxlinenr = '☰ '
:let g:airline_symbols.dirty=' ⚡'
:let g:airline_symbols.paste = 'Þ'
:let g:airline_symbols.spell = 'SP'
:let g:airline_symbols.whitespace = ''
:let g:airline_symbols.notexists = ' x '

:let g:airline#extensions#tabline#buffer_nr_show = 1

:hi CursorLineNr guifg=white

" Gitgutter
" :let g:gitgutter_git_executable = 'C:/Program Files/Git/bin/git.exe'
:highlight! link SignColumn LineNr
:let g:gitgutter_sign_allow_clobber = 1
:set signcolumn=yes
