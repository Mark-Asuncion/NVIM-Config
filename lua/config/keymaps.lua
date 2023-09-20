vim.g.mapleader=" "
vim.keymap.set({'n','i', 'v'},'<A-a>', '<Esc>',{})
-- selection
vim.keymap.set('n','<leader>V', 'v$h',{})
-- copy and pasting
vim.keymap.set('n','<leader>ay', '<cmd>%y+<CR>',{})
vim.keymap.set('n','<leader>Y', '"+y$',{})
vim.keymap.set('v','<leader>y', '"+y',{})
vim.keymap.set({'n','v'},'<leader>p', '"+p',{})
vim.keymap.set({'n','v'},'<leader>P', '"+P',{})
vim.keymap.set('v','y','"0y',{})
vim.keymap.set('v','Y','"0Y',{})
vim.keymap.set('v','p','"0p',{})
vim.keymap.set('v','P','"0P',{})
-- buffer nav
vim.keymap.set('n','<A-l>', '<cmd>bn<CR>',{})
vim.keymap.set('n','<A-h>', '<cmd>bp<CR>',{})
vim.keymap.set('n','<leader>w','<cmd>bw<CR>',{})
-- quickfix navi
vim.keymap.set('n','<C-j>','<cmd>cn<CR>',{})
vim.keymap.set('n','<C-k>','<cmd>cp<CR>',{})

vim.api.nvim_create_user_command("Grep","grep -S <args>",{
    nargs = 1,
})
vim.api.nvim_create_user_command("Wrap",
    function()
        vim.opt.wrap = not vim.opt.wrap._value
    end,{})
vim.api.nvim_create_user_command("CpFileCWD","let @+ = expand(\"%\")",{ desc = "Copy Filename path relative to cwd" })
vim.api.nvim_create_user_command("CpFileRoot","let @+ = expand(\"%:p\")",{ desc = "Copy Filename path from root" })
