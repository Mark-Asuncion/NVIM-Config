local theme_flavour = "mocha"
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
        dependencies = {
            {
                "akinsho/bufferline.nvim",
                opts = {
                    highlights = require("catppuccin.groups.integrations.bufferline").get {
                        styles = { "italic", "bold" },
                        custom = {
                            all = {
                                fill = { bg = "none" },
                            },
                        },
                    }
                },
            },
        },
        opts = {
            flavour = theme_flavour,
            transparent_background = true,
            custom_highlights = function(colors)
                return {
                    NormalFloat = { bg = colors.crust },
                }
            end,
            integrations = {
                navic = {
                    enabled = true,
                    custom_bg = "NONE", -- "lualine" will set background to mantle
                },
            }
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}
