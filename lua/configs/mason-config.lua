require("mason").setup({
    ui = {
        icons = {
            package_installed = "/",
            package_pending = "-",
            package_uninstalled = "X"
        }
    }
})
require("mason-lspconfig").setup()
local lspconfig = require('lspconfig')

-- activate LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.clangd.setup {
    capabilities = capabilities,
}
lspconfig.html.setup {
    capabilities = capabilities,
}
lspconfig.cssls.setup {
    capabilities = capabilities,
}
lspconfig.pyright.setup {
    capabilities = capabilities,
}
