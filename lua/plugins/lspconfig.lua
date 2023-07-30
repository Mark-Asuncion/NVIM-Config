return {

    { "hrsh7th/cmp-nvim-lsp" },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "simrat39/rust-tools.nvim",
        },
        opts = {
            autoformat = false,
            setup = {
                rust_analyzer = function(_, opts)
                    local rt = require("rust-tools")
                    local opt = opts
                    opt.on_attach = function(_, bufnr)
                        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                        -- Code action groups
                        vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
                    end
                    rt.setup({ server = opt })
                    return true
                end,
            },
        },
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
                "rust",
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
                "pyright",
                "rust-analyzer",
            },
        },
    },
}
