-- native keymaps
vim.g.mapleader=" "
vim.api.nvim_set_keymap('i','<A-a>', '<Esc>', {noremap=true})
vim.api.nvim_set_keymap('v','<A-a>', '<Esc>', {noremap=true})
-- copy and pasting
vim.api.nvim_set_keymap('n','<leader>y', '"+y', {noremap=true})
vim.api.nvim_set_keymap('n','<leader>p', '"+p', {noremap=true})
vim.api.nvim_set_keymap('v','<leader>y', '"+y', {noremap=true})
vim.api.nvim_set_keymap('v','<leader>p', '"+p', {noremap=true})
vim.keymap.set('v','y','"0y',{})
vim.keymap.set('v','Y','"0Y',{})
vim.keymap.set('v','p','"0p',{})
vim.keymap.set('v','P','"0P',{})
-- buffer nav
vim.api.nvim_set_keymap('n','<leader>n', ':bn<CR>', {noremap=true})
vim.api.nvim_set_keymap('n','<leader>P', ':bp<CR>', {noremap=true})
-- closed pairs
vim.api.nvim_set_keymap('i','{', '{}<left>', {noremap=true})
vim.api.nvim_set_keymap('i','{<CR>', '{<CR>}<ESC>O', {noremap=true})
vim.api.nvim_set_keymap('i','(', '()<left>', {noremap=true})
vim.api.nvim_set_keymap('i','[', '[]<left>', {noremap=true})
vim.api.nvim_set_keymap('i','"', '""<left>', {noremap=true})
vim.api.nvim_set_keymap('i','\'', '\'\'<left>', {noremap=true})
-- tree keymaps
vim.api.nvim_set_keymap('n','<leader>]', ':NvimTreeToggle<CR>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<leader>[', ':NvimTreeFocus<CR>',{noremap=true,silent=true})

-- comment keymaps
vim.keymap.set('n',';', ':CommentToggle<CR>', {})
vim.keymap.set('v',';', ':CommentToggle<CR>', {})

-- lsp keymaps
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
