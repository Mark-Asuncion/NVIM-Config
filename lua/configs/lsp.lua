require("mason").setup({
    ui = {
        icons = {
            package_installed = "/",
            package_pending = "-",
            package_uninstalled = "X"
        }
    }
})
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
-- activate LSP
local lsp = {
    "clangd",
    "html",
    "cssls",
    "pyright",
}
for _,lsp in pairs(lsp) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
end
