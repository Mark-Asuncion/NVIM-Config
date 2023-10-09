vim.opt.guicursor="i:block"
vim.opt.relativenumber=true
vim.opt.scrolloff=20
vim.opt.incsearch=true
vim.opt.hlsearch=false
vim.opt.number=true
vim.opt.cursorline=true
vim.opt.wrap=false
vim.opt.updatetime=1000
-- vim.opt.cursorlineopt=number
-- vim.opt.selection=exclusive
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.termguicolors=true
vim.opt.encoding="UTF-8"
-- persistent undo
vim.opt.undofile=true
vim.opt.undodir=vim.fn.expand("~/.undo//")
vim.opt.undolevels=1000
vim.api.nvim_set_hl(0,"CursorLineNr",{ fg="White" })
vim.opt.signcolumn="yes"

vim.opt.list = true
vim.opt.listchars:append({
    space = "·",
})
vim.cmd[[ set foldmethod=expr ]]
vim.cmd[[ set foldexpr=nvim_treesitter#foldexpr() ]]
vim.cmd[[ set nofoldenable ]]
vim.opt.colorcolumn="160"
vim.opt.pumblend=0
vim.opt.winbar=' '
