if vim.g.vscode then
    -- vim.keymap.set({'n','i', 'v'},'<A-a>', '<Esc>',{})
    vim.opt.clipboard="unnamedplus"
    vim.opt.scrolloff=10
    vim.opt.incsearch=true
    vim.opt.hlsearch=false
else
    require("config.lazy")
end