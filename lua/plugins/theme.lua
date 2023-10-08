return {
    -- {
    --     "folke/tokyonight.nvim",
    --     opts = {
    --         style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    --         transparent = true, -- Enable this to disable setting the background color
    --         terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    --         styles = {
    --             -- Style to be applied to different syntax groups
    --             -- Value is any valid attr-list value for `:help nvim_set_hl`
    --             comments = { italic = true },
    --             keywords = { italic = true },
    --             functions = {},
    --             variables = {},
    --             -- Background styles. Can be "dark", "transparent" or "normal"
    --             sidebars = "transparent", -- style for sidebars, see below
    --             floats = "transparent", -- style for floating windows
    --         },
    --         dim_inactive = false, -- dims inactive windows
    --     },
    -- },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = function()
            local theme_flavour = "mocha"
            return {
                flavour = theme_flavour,
                transparent_background = true,
                -- custom_highlights = function(colors)
                --     return {
                --         NormalFloat = { bg = colors.none },
                --     }
                -- end,
                integrations = {
                    navic = {
                        enabled = true,
                        custom_bg = "NONE",
                    },
                }
            }
        end,
        config = function(_,opts)
            vim.cmd[[colorscheme catppuccin]]
            vim.cmd[[highlight NormalFloat guibg=NONE]]
            require("catppuccin").setup(opts)
        end
    },
    {
        "goolord/alpha-nvim",
        opts = function(_,_)
            local dashboard = require("alpha.themes.dashboard")
            local catppuccin_cat = {
                "  ⟋|､",
                " (°､ ｡ 7",
                " |､  ~ヽ",
                " じしf_,)〳",
            }
            dashboard.section.header.val = catppuccin_cat
            dashboard.section.buttons.val = {
                -- dashboard.button("f", " " .. " Find file", "<cmd> Telescope find_files <cr>"),
                dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
                dashboard.button("r", " " .. " Recent files", "<cmd> Telescope oldfiles <cr>"),
                dashboard.button("g", " " .. " Find text", "<cmd> Telescope live_grep <cr>"),
                dashboard.button("c", " " .. " Config", "<cmd> e $MYVIMRC <cr>"),
                dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
                dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
                dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
            }
            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = "AlphaButtons"
                button.opts.hl_shortcut = "AlphaShortcut"
            end
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.section.footer.opts.hl = "AlphaFooter"
            dashboard.opts.layout[1].val = 8
            return dashboard
        end,
        config = function(_,opts)
            require("alpha").setup(opts.opts)
            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    opts.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end
    },
    {
        "SmiteshP/nvim-navic",
        event = "VeryLazy",
        opts = {
            icons = {
                File          = "󰈙 ",
                Module        = " ",
                Namespace     = "󰌗 ",
                Package       = " ",
                Class         = "󰌗 ",
                Method        = "󰆧 ",
                Property      = " ",
                Field         = " ",
                Constructor   = " ",
                Enum          = "󰕘",
                Interface     = "󰕘",
                Function      = "󰊕 ",
                Variable      = "󰆧 ",
                Constant      = "󰏿 ",
                String        = "󰀬 ",
                Number        = "󰎠 ",
                Boolean       = "◩ ",
                Array         = "󰅪 ",
                Object        = "󰅩 ",
                Key           = "󰌋 ",
                Null          = "󰟢 ",
                EnumMember    = " ",
                Struct        = "󰌗 ",
                Event         = " ",
                Operator      = "󰆕 ",
                TypeParameter = "󰊄 ",
            },
            lsp = {
                auto_attach = true,
                preference = nil,
            },
            highlight = true,
            separator = " > ",
            depth_limit = 0,
            depth_limit_indicator = "..",
            safe_output = true,
            lazy_update_context = false,
            click = true
        },
        config = function(_,opts)
            require("nvim-navic").setup(opts)
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            "SmiteshP/nvim-navic",
        },
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        'filename',
                        newfile_status = true,
                        path = 1,
                        symbols = {
                            modified = '[+]',      -- Text to show when the file is modified.
                            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                            unnamed = '[No Name]', -- Text to show for unnamed buffers.
                            newfile = '[New]',     -- Text to show for newly created file before first write
                        }
                    }
                },
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {
                lualine_c = {
                    {
                        "navic",
                        color_correction = "dynamic",
                        navic_opts = nil,
                        condition = true
                    }
                }
            },
            inactive_winbar = {},
            extensions = {}
        },
        config = function(_,opts)
            require("lualine").setup(opts)
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup()
        end
    }
}
