vim.g.mapleader=" "
vim.keymap.set('t','<C-BS>','<C-\\><C-n>',{})
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

vim.api.nvim_create_user_command("GrepWord",function(arg)
    local word = vim.fn.expand("<cword>")
    local file = arg.args
    if string.len(word) == 0 then
        return
    end
    vim.cmd("grep " .. word .. ' ' .. file)
    end, {
        desc = "Grep word under cursor",
        nargs = '?'
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
vim.api.nvim_create_user_command("SetTab", function(args)
    local w = args["args"]
    if w == '' then
        return vim.g.setTab(4)
    end
    local tab = tonumber(w)
    if tab == nil then
        vim.notify("Argument " .. w .. " is not a number", vim.log.levels.ERROR)
        return
    end
    if tab == 0 then
        return vim.g.setTab(4)
    end
    vim.o.tabstop=tab
    vim.o.shiftwidth=tab
end,{ nargs='?' })
