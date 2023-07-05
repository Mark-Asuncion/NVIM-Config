return {
    "neovim/nvim-lspconfig",
    opts = {
        autoformat = false,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "html",
                "css",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
                "cpp",
                "comment",
            },
        },
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shfmt",
                "clangd",
                "html-lsp",
                "css-lsp",
                "typescript-language-server",
                "black",
                "prettier",
            },
        },
    },
}
