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
        opts = {
            transparent_background = true,
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}
