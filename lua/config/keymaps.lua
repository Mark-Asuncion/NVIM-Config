vim.g.mapleader=" "
vim.keymap.set({'n','i', 'v'},'<A-a>', '<Esc>',{})
-- movement
vim.keymap.set({'n','v'},'j', 'gj',{})
vim.keymap.set({'n','v'},'k', 'gk',{})
-- selection
vim.keymap.set('n','<leader>V', 'v$h',{})
-- copy and pasting
vim.keymap.set('n','<leader>ay', '<cmd>%y+<CR>',{})
vim.keymap.set('n','<leader>Y', '"+y$',{})
vim.keymap.set('v','<leader>y', '"+y',{})
vim.keymap.set({'n','v'},'<leader>p', '"+p',{})
vim.keymap.set({'n','v'},'<leader>P', '"+P',{})
vim.keymap.set('v','p','"0p',{})
vim.keymap.set('v','P','"0P',{})
-- buffer
vim.keymap.set('n','<S-h>', '<cmd>bp<CR>',{})
vim.keymap.set('n','<S-l>', '<cmd>bn<CR>',{})
vim.keymap.set('n','<leader>w','<cmd>bw<CR>',{})
vim.keymap.set('n','<leader>W','<cmd>bw!<CR>',{})
-- quickfix navi
vim.keymap.set('n','<C-j>','<cmd>cn<CR>',{})
vim.keymap.set('n','<C-k>','<cmd>cp<CR>',{})
-- scrolling
vim.keymap.set('n','<A-j>', '10j',{})
vim.keymap.set('n','<A-k>', '10k',{})
vim.keymap.set('n','<C-d>','<C-d>zz',{})
vim.keymap.set('n','<C-u>','<C-u>zz',{})
-- resizing windows
vim.keymap.set('n','<A-Left>','<cmd>vertical resize -5<cr>',{})
vim.keymap.set('n','<A-Right>','<cmd>vertical resize +5<cr>',{})
vim.keymap.set('n','<A-Up>','<cmd>resize +5<cr>',{})
vim.keymap.set('n','<A-Down>','<cmd>resize -5<cr>',{})

if vim.fn.executable("rg") then
    vim.opt.grepprg="rg --vimgrep -S"
end
vim.api.nvim_create_user_command("Grep","grep <args>",{
    nargs = 1,
})
vim.api.nvim_create_user_command("Wrap", function()
        vim.o.wrap = not vim.o.wrap
    end,{})
vim.api.nvim_create_user_command("Trim",
    function(arg)
        if arg.range == 0 then
            vim.cmd[[%s/\s\+$]]
        else
            vim.cmd[['<,'>s/\s\+$]]
        end
    end,{ range = true })
vim.api.nvim_create_user_command("CpFileCWD","let @+ = expand(\"%\")",{ desc = "Copy Filename path relative to cwd" })
vim.api.nvim_create_user_command("CpFileRoot","let @+ = expand(\"%:p\")",{ desc = "Copy Filename path from root" })
