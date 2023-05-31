-- native keymaps
vim.g.mapleader=" "
vim.api.nvim_set_keymap('i','<A-a>', '<Esc>', {noremap=true})
vim.api.nvim_set_keymap('v','<A-a>', '<Esc>', {noremap=true})
-- copy and pasting
vim.api.nvim_set_keymap('n','<leader>y', '"+y', {noremap=true})
vim.api.nvim_set_keymap('n','<leader>p', '"+p', {noremap=true})
vim.api.nvim_set_keymap('v','<leader>y', '"+y', {noremap=true})
vim.api.nvim_set_keymap('v','<leader>p', '"+p', {noremap=true})
vim.keymap.set('v','y','"0y',{})
vim.keymap.set('v','Y','"0Y',{})
vim.keymap.set('v','p','"0p',{})
vim.keymap.set('v','P','"0P',{})
-- buffer nav
vim.api.nvim_set_keymap('n','<leader>n', ':bn<CR>', {noremap=true})
vim.api.nvim_set_keymap('n','<leader>P', ':bp<CR>', {noremap=true})
-- quickfix navi
vim.keymap.set('n','<C-j>',':cn<CR>',{})
vim.keymap.set('n','<C-k>',':cp<CR>',{})
