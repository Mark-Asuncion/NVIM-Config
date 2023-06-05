vim.g.mapleader=" "
-- native keymaps
vim.keymap.set({'n','i', 'v'},'<A-a>', '<Esc>',{})
-- copy and pasting
vim.keymap.set('v','<leader>y', '"+y',{})
vim.keymap.set({'n','v'},'<leader>p', '"+p',{})
vim.keymap.set('v','y','"0y',{})
vim.keymap.set('v','Y','"0Y',{})
vim.keymap.set('v','p','"0p',{})
vim.keymap.set('v','P','"0P',{})
-- buffer nav
vim.keymap.set('n','<leader>n', ':bn<CR>',{})
vim.keymap.set('n','<leader>P', ':bp<CR>',{})
vim.keymap.set('n','<leader>w',':bw<CR>',{})
-- quickfix navi
vim.keymap.set('n','<C-j>',':cn<CR>',{})
vim.keymap.set('n','<C-k>',':cp<CR>',{})
