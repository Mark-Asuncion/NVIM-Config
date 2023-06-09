-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard=""
vim.opt.guicursor="i:block"
vim.opt.relativenumber=true
vim.opt.scrolloff=10
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
vim.opt.undodir=vim.fn.expand("~/AppData/local/nvim/undo//")
-- vim.opt.undodir=vim.fn.expand("~/.config/nvim/undo//")
vim.opt.undolevels=1000
-- vim.cmd[[hi CursorLineNr guifg=white]]
vim.api.nvim_set_hl(0,"CursorLineNr",{ fg="White" })
-- Gitgutter
-- vim.g.gitgutter_sign_allow_clobber = 1
vim.opt.signcolumn="yes"

vim.opt.list = true
vim.opt.listchars:append({
    space = "",
})
