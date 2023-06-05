local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
require('configs.mappings.native')
vim.opt.guicursor="i:block"
vim.opt.relativenumber=true
vim.opt.scrolloff=10
vim.opt.incsearch=true
vim.opt.hlsearch=false
vim.opt.number=true
vim.opt.cursorline=true
vim.opt.wrap=false
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
vim.opt.undolevels=1000
vim.cmd[[hi CursorLineNr guifg=white]]
-- Gitgutter
-- :highlight! link SignColumn LineNr
vim.g.gitgutter_sign_allow_clobber = 1
vim.opt.signcolumn="yes"

vim.opt.list = true
vim.opt.listchars:append({
    space = "",
})
require('settings')
