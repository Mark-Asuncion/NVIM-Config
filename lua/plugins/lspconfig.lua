local ensure_installed_package = {
    "bash-language-server",
    "clangd",
    "css-lsp",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "pyright",
    "rust-analyzer",
    "typescript-language-server",
    "vim-language-server"
}

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
                dependencies = {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
                opts = {
                    history = true,
                    delete_check_events = "TextChanged",
                }
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
                config = function()
                    require('ts_context_commentstring').setup {}
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
            context_commentstring = { enable = true },
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
                border="rounded"
            },
        }
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
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "folke/neodev.nvim",
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "simrat39/rust-tools.nvim",
            "hrsh7th/nvim-cmp",
            "nvimtools/none-ls.nvim",
        },
        opts = {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "󰝤",
                },
                severity_sort = true,
            },
            inlay_hints = {
                enabled = false,
            },
            autoformat = false,
            format = {
                formatting_options = nil,
                timeout_ms = nil,
            },
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
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' }
                            },
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                }
            }
        },
        config = function(_,opts)
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

            vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', ']e', function()
                vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
            end)
            vim.keymap.set('n', '[e', function()
                vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
            end)
            vim.keymap.set('n', ']w', function()
                vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
            end)
            vim.keymap.set('n', '[w', function()
                vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
            end)
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local aug_opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, aug_opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, aug_opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, aug_opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, aug_opts)
                    vim.keymap.set('n', '<leader>ck', vim.lsp.buf.signature_help, aug_opts)
                    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, aug_opts)
                    vim.keymap.set('n', '<leader>cD', vim.lsp.buf.type_definition, aug_opts)
                    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, aug_opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, aug_opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, aug_opts)

                    vim.api.nvim_create_user_command("WorkspaceAdd", vim.lsp.buf.add_workspace_folder, {})
                    vim.api.nvim_create_user_command("WorkspaceRm", vim.lsp.buf.remove_workspace_folder, {})
                    vim.api.nvim_create_user_command("WorkspaceList", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, {})
                    vim.api.nvim_create_user_command("References", vim.lsp.buf.references, {})
                    vim.api.nvim_create_user_command("Format", function(arg)
                        local function selRange()
                            if arg.range == 0 then
                                return nil
                            end
                            return {
                                ["start"] = { arg.line1, 0 },
                                ["end"] = { arg.line2, 0 }
                            }
                        end
                        vim.lsp.buf.format({
                            buffer = 0,
                            async = true,
                            range = selRange()
                        })
                    end, { range = true })
                end
            })

            vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
            local servers = opts.servers
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = cmp_nvim_lsp.default_capabilities()

            local function setup(server)
                local server_opts = vim.tbl_deep_extend("force", {
                    capabilities = vim.deepcopy(capabilities),
                }, servers[server] or {})
                require("lspconfig")[server].setup(server_opts)
            end

            local ensure_installed = {}
            local mappings_server = require("mason-lspconfig.mappings.server")
            local mason_reg = require("mason-registry")
            for _, name in pairs(vim.tbl_keys(mappings_server.lspconfig_to_package)) do
                if vim.tbl_contains(ensure_installed_package,mappings_server.lspconfig_to_package[name]) then
                    ensure_installed[#ensure_installed+1] = name
                end
                if mason_reg.is_installed(mappings_server.lspconfig_to_package[name]) then
                    setup(name)
                end
            end

            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
                automatic_installation = true,
                handlers = { setup }
            })

        end,
    }
}
