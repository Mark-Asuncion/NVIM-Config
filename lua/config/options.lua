vim.o.guicursor="i:block"
vim.o.relativenumber=true
vim.o.scrolloff=20
vim.o.incsearch=true
vim.o.hlsearch=false
vim.o.number=true
vim.o.cursorline=true
vim.o.wrap=false
vim.o.updatetime=1000
-- vim.o.cursorlineopt=number
-- vim.o.selection=exclusive
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.expandtab=true
vim.o.termguicolors=true
vim.o.encoding="UTF-8"
-- persistent undo
vim.o.undofile=true
vim.o.undodir=vim.fn.expand("~/.undo//")
vim.o.undolevels=1000
vim.o.signcolumn="yes"

vim.o.list = true
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
    return ' ( ' . (v:foldend - v:foldstart) . ' L ) ' . trim(getline(v:foldstart)) . ' ... ' . trim(getline(v:foldend))
endfunction
]], { output = false })
vim.o.foldtext="FoldText()"
vim.o.colorcolumn="160"
vim.o.pumblend=0
vim.o.winbar=' '
vim.o.ignorecase=true
vim.o.smartcase=true
vim.o.smartindent=true
vim.o.splitbelow=true
vim.o.splitright=true

if vim.fn.executable("rg") then
    vim.o.grepprg="rg --vimgrep -S"
end
if vim.fn.executable("/bin/zsh") then
    vim.o.shell="/bin/zsh"
end
