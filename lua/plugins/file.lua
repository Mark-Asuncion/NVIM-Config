local PLUGIN_KEYMAPS = require("config.plugins.keymaps")
return {
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    -- {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     event = { "BufWinEnter" },
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --         "MunifTanjim/nui.nvim",
    --     },
    --     keys = PLUGIN_KEYMAPS.FILE_EX.toggle_file_ex,
    --     opts = {
    --         close_if_last_window = true,
    --         filesystem = {
    --             group_empty_dirs = true,
    --             hijack_netrw_behavior = "open_current",
    --             filtered_items = {
    --                 visible = false, -- when true, they will just be displayed differently than normal items
    --                 hide_dotfiles = false,
    --                 hide_gitignored = false,
    --                 hide_hidden = false,
    --             },
    --         },
    --         default_component_configs = {
    --             icon = {
    --                 folder_closed = "",
    --                 folder_open = "",
    --                 folder_empty = "",
    --                 -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
    --                 -- then these will never be used.
    --                 default = "*",
    --                 highlight = "NeoTreeFileIcon",
    --             },
    --             modified = {
    --                 symbol = "[+]",
    --                 highlight = "NeoTreeModified",
    --             },
    --             git_status = {
    --                 symbols = {
    --                     -- Change type
    --                     added = "✚",
    --                     deleted = "✖",
    --                     modified = "",
    --                     renamed = "r",
    --                     -- Status type
    --                     untracked = "",
    --                     ignored = "",
    --                     unstaged = "",
    --                     staged = "",
    --                     conflict = "",
    --                 },
    --             },
    --         },
    --     },
    --     config = function(_, opts)
    --         require("neo-tree").setup(opts)
    --     end,
    -- },
    -- {
    --     "nvim-telescope/telescope.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    --     cmd = { "Telescope" },
    --     keys = function(_, _) return PLUGIN_KEYMAPS.FILE_EX.finder() end,
    --     config = function(_, opts)
    --         require("telescope").setup(opts)
    --     end,
    -- },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {
            indent = {
                tab_char = '',
                smart_indent_cap = true,
                priority = 2,
            }
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        keys = PLUGIN_KEYMAPS.GIT.keys,
        config = function()
            require("gitsigns").setup()
            vim.api.nvim_create_user_command("Gitblame", "Gitsigns blame_line",{ desc = "Git Blame" })
            vim.api.nvim_create_user_command("GitTogblame", "Gitsigns toggle_current_line_blame",{ desc = "Git Toggle Blame" })
        end
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen" },
    },
    {
        "mbbill/undotree",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = { "InsertEnter" },
        keys = PLUGIN_KEYMAPS.Undo,
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        config = function()
            require("mini.surround").setup()
        end
    },
    {
        'echasnovski/mini.ai',
        version = '*',
        config = function()
            require("mini.ai").setup()
        end
    },
    {
        'echasnovski/mini.pairs',
        event = "InsertEnter",
        version = '*',
        config = function(_, opts)
            require("mini.pairs").setup(opts)
        end,
    },
    {
        "echasnovski/mini.comment",
        event = "InsertEnter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "JoosepAlviste/nvim-ts-context-commentstring"
        },
        opts = {
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
                end,
            },
        },
        config = function(_, opts)
            require("mini.comment").setup(opts)
        end
    }
}
