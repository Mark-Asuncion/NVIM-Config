-- vim.cmd("let g:airline#extensions#tabline#enabled = 1")
-- vim.cmd([[let g:airline#extensions#tabline#left_sep = ' ']])
-- vim.cmd([[let g:airline#extensions#tabline#left_alt_sep = '|']])
-- vim.cmd([[let g:airline#extensions#tabline#formatter = 'default']])
vim.cmd([[let g:airline_theme='deus']])
if vim.g.airline_symbols == nil then
    vim.g.airline_symbols = {}
end
vim.g.airline_powerline_fonts = 1
-- vim.g.airline_stl_path_style = 'short'
vim.g.airline_section_c = '%F'
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
local al_symbols = vim.g.airline_symbols

al_symbols.branch = ''
al_symbols.colnr = ' :'
al_symbols.readonly = ''
al_symbols.linenr = ' :'
al_symbols.maxlinenr = '☰ '
al_symbols.dirty=' ⚡'
al_symbols.paste = 'Þ'
al_symbols.spell = 'SP'
al_symbols.whitespace = ''
al_symbols.notexists = ' x '
vim.g.airline_symbols = al_symbols

-- vim.cmd([[let g:airline#extensions#tabline#buffer_nr_show = 1]])
-- vim.cmd([[let g:airline#extensions#bufferline#enabled = 0]])
vim.cmd([[let g:airline#extensions#tabline#enabled = 0]])
