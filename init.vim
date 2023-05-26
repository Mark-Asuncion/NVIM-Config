:set guicursor=i:block
:set rnu
:set scrolloff=10
:set incsearch
:set nohlsearch 
:set number
:set cursorline
:set nowrap
" :set cursorlineopt=number
" :set selection=exclusive
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set termguicolors
:set encoding=UTF-8
lua require('settings')
:hi CursorLineNr guifg=white
" Gitgutter
" :let g:gitgutter_git_executable = 'C:/Program Files/Git/bin/git.exe'
" :highlight! link SignColumn LineNr
:let g:gitgutter_sign_allow_clobber = 1
:set signcolumn=yes
