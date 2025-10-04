local M = {}
-- @type vim.diagnostic.Opts
M.diagnostic = {
    virtual_text = {
        spacing = 4,
        source = true,
        -- prefix = "󰝤",
        prefix = "●",
    },
    -- virtual_lines = {
    --     current_line = true
    -- },
    severity_sort = true,
}

M.packages = {
    -- "bash-language-server",
    -- "clangd",
    "css-lsp",
    "html-lsp",
    -- "json-lsp",
    -- "lua-language-server",
    -- "pyright",
    -- "rust-analyzer",
    -- "typescript-language-server",
    -- "vim-language-server"
}

return M
