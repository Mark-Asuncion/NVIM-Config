return {
    {
        "navarasu/onedark.nvim",
        opts = {
            -- Main options --
            style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = false,  -- Show/hide background
            term_colors = true, -- Change terminal color as per the selected theme style
            ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
            cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

            -- toggle theme style ---
            toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
            toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

            -- Change code style ---
            -- Options are italic, bold, underline, none
            -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
            code_style = {
                comments = 'italic',
                keywords = 'none',
                functions = 'none',
                strings = 'none',
                variables = 'none'
            },

            -- Lualine options --
            lualine = {
                transparent = false, -- lualine center bar transparency
            },

            -- Custom Highlights --
            colors = {}, -- Override default colors
            highlights =  {
                FloatBorder = { bg = "$bg0" },
                NormalFloat = { bg = "$bg0" },
            }, -- Override highlight groups

            -- Plugins Config --
            diagnostics = {
                darker = true, -- darker colors for diagnostic
                undercurl = true,   -- use undercurl instead of underline for diagnostics
                background = true,    -- use background color for virtual text
            },
        },
        config = function(_,opts)
            require("onedark").setup(opts)
            vim.cmd[[colorscheme onedark]]
        end
    },
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
    --             sidebars = "dark", -- style for sidebars, see below
    --             floats = "dark", -- style for floating windows
    --         },
    --         dim_inactive = false, -- dims inactive windows
    --     },
    -- },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     opts = {
    --         flavour = "mocha",
    --         transparent_background = true,
    --         -- custom_highlights = function(colors)
    --         --     return {
    --         --         NormalFloat = { bg = colors.none },
    --         --     }
    --         -- end,
    --         integrations = {
    --             navic = {
    --                 enabled = true,
    --                 custom_bg = "NONE",
    --             },
    --         }
    --     },
    --     config = function(_,opts)
    --         require("catppuccin").setup(opts)
    --         vim.cmd[[colorscheme catppuccin]]
    --         vim.cmd[[highlight NormalFloat guibg=NONE]]
    --     end
    -- },
    {
        "goolord/alpha-nvim",
        opts = function(_,_)
            local dashboard = require("alpha.themes.dashboard")
            local nvim_ascii = {
                "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
                "████╗  ██║██║   ██║██║████╗ ████║",
                "██╔██╗ ██║██║   ██║██║██╔████╔██║",
                "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
                "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
            }
            dashboard.section.header.val = nvim_ascii
            dashboard.section.buttons.val = {
                dashboard.button("f", " " .. " Find file", "<cmd>lua Snacks.picker.files() <cr>"),
                dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
                -- dashboard.button("r", " " .. " Recent files", "<cmd> Telescope oldfiles <cr>"),
                dashboard.button("g", " " .. " Find text", "<cmd>lua Snacks.picker.grep() <cr>"),
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
        dependencies = { "neovim/nvim-lspconfig" },
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
            separator = "  ",
            depth_limit = 10,
            depth_limit_indicator = "..",
            safe_output = true,
            lazy_update_context = true,
            click = true
        },
        config = function(_,opts)
            require("nvim-navic").setup(opts)
            vim.g.navic_silence = true
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            options = {
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                -- globalstatus = true,
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
                            modified = ' ●',      -- Text to show when the file is modified.
                            readonly = ' ',      -- Text to show when the file is non-modifiable or readonly.
                            unnamed = '', -- Text to show for unnamed buffers.
                            newfile = ' ',     -- Text to show for newly created file before first write
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
                        color_correction = "nil",
                        navic_opts = nil
                    }
                }
            },
            inactive_winbar = {},
            extensions = {}
        },
        config = function(_,opts)
            require("lualine").setup(opts)
        end
    }
}
