return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp",
                opts = {
                    sources = {
                        { name = 'nvim_lsp' }
                    }
                }
            },
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                },
                opts = {
                    history = true,
                    delete_check_events = "TextChanged",
                },
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end
            },
            "petertriho/cmp-git",
            "hrsh7th/cmp-cmdline",
            "nvim-web-devicons",
            "onsails/lspkind.nvim"
        },
        opts = function()
            local cmp = require("cmp")
            return {
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered({
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                    }),
                    documentation = cmp.config.window.bordered({
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                    }),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                }),
                experimental = {
                    ghost_text = {
                        hl_group = "Comment",
                    },
                },
                formatting = {
                    format = function(entry, vim_item)
                        if vim.tbl_contains({ 'path' }, entry.source.name) then
                            local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
                            if icon then
                                vim_item.kind = icon .. ' ' .. vim_item.kind
                                vim_item.kind_hl_group = hl_group
                                return vim_item
                            end
                        end
                        return require('lspkind').cmp_format({ with_text = true })(entry, vim_item)
                    end
                }
            }
        end,
        config = function(_,opts)
            local cmp = require("cmp")
            cmp.setup(opts)
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' },
                    { name = 'buffer' },
                })
            })

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', '!' }
                        }
                    },
                    { name = 'path' }
                })
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            {
                "JoosepAlviste/nvim-ts-context-commentstring",
                opts = {
                    enable_autocmd = false,
                    languages = {
                        c = '// %s',
                        cpp = '// %s'
                    },
                },
                config = function(_,opts)
                    require('ts_context_commentstring').setup(opts)
                    vim.g.skip_ts_context_comments_string_module = true
                end
            },
            {
                "nvim-treesitter/nvim-treesitter-context",
                opts = {
                    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                    max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
                    min_window_height = 2, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                    line_numbers = true,
                    multiline_threshold = 20, -- Maximum number of lines to show for a single context
                    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
                    separator = "─",
                    zindex = 20, -- The Z-index of the context window
                    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
                },
            }
        },
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
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
            indent = { enable = true },
            -- context_commentstring = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    include_surrounding_whitespace = false
                }
            }
        },
        config = function(_,opts)
            require("nvim-treesitter.configs").setup(opts)
            vim.cmd[[ set foldmethod=expr ]]
            vim.cmd[[ set foldexpr=nvim_treesitter#foldexpr() ]]
            vim.o.foldlevel=99
        end
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        cmd = "Mason",
        opts = {
            ui = {
                border="solid"
            },
        },
        config = function()
            require("mason").setup()
            local ensure_installed = {}
            local mappings_server = require("mason-lspconfig.mappings").get_mason_map()
            local ensure_installed_package = require("config.lsp").packages
            for _, name in pairs(vim.tbl_keys(mappings_server.lspconfig_to_package)) do
                if vim.tbl_contains(ensure_installed_package,mappings_server.lspconfig_to_package[name]) then
                    ensure_installed[#ensure_installed+1] = name
                end
            end

            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
                automatic_installation = true,
            })
        end
    },
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = function()
            local null_ls = require("null-ls")
            return {
                sources = {
                    null_ls.builtins.formatting.fish_indent,
                    null_ls.builtins.diagnostics.fish,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.shfmt,
                },
            }
        end
    },
    {
        "mrcjkb/rustaceanvim",
        version = '^6',
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "folke/neodev.nvim",
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "mrcjkb/rustaceanvim",
            "hrsh7th/nvim-cmp",
            "nvimtools/none-ls.nvim",
        }
    }
}
