return {
    {
        "hrsh7th/nvim-cmp",
        opts = function(_,opts)
            local cmp = require("cmp")
            opts.window = {
                completion = cmp.config.window.bordered({
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                }),
                documentation = cmp.config.window.bordered({
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                }),
            }
            return opts
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "simrat39/rust-tools.nvim",
        },
        opts = function(_,opts)
            local border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
            }
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end
            require('lspconfig.ui.windows').default_options.border = 'rounded'
            opts.autoformat = false
            opts.setup = {
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
            }
            return opts
        end
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
                "jsdoc",
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
            ui = {
                border="rounded"
            },
        },
    },
}
