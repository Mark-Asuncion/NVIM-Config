local builtin = require('telescope.builtin')
vim.g.telescope_builtin = builtin
vim.keymap.set('n', '<leader>ff', ':lua vim.g.telescope_builtin.find_files({no_ignore=true})<CR>', {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>gg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
function buffer_find()
    builtin.current_buffer_fuzzy_find()
end
vim.cmd([[command! Bfind lua buffer_find()]])
