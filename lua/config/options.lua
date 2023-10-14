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
    extends = "",
})
vim.opt.fillchars:append({
    fold = "─",
    diff = "╱"
})
vim.api.nvim_exec2([[
function! FoldText()
    return ' ( ' . (v:foldend - v:foldstart) . ' L) ' . getline(v:foldstart) . ' ... ' . getline(v:foldend)
endfunction
]], { output = false })
vim.opt.foldtext="FoldText()"
vim.opt.colorcolumn="160"
vim.opt.pumblend=0
vim.opt.winbar=' '
