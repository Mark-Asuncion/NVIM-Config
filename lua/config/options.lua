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
vim.opt.foldcolumn="1"
vim.opt.signcolumn="yes"

vim.opt.list = true
vim.opt.listchars:append({
    space = "·",
    extends = "",
})
vim.opt.fillchars:append({
    fold = "─",
    foldclose = "",
    foldopen = "",
    diff = "╱"
})
vim.api.nvim_exec2([[
function! FoldText()
    return ' ( ' . (v:foldend - v:foldstart) . ' L) ' . trim(getline(v:foldstart)) . ' ... ' . trim(getline(v:foldend))
endfunction
]], { output = false })
vim.opt.foldtext="FoldText()"
vim.opt.colorcolumn="160"
vim.opt.pumblend=0
vim.opt.winbar=' '
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.smartindent=true
vim.opt.splitbelow=true
vim.opt.splitright=true
