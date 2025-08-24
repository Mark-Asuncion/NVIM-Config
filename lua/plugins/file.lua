local PLUGIN_KEYMAPS = require("config.plugin_keymaps")
return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        event = { "BufWinEnter" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = PLUGIN_KEYMAPS.FILE_EX.toggle_file_ex,
        opts = {
            close_if_last_window = true,
            filesystem = {
                group_empty_dirs = true,
                hijack_netrw_behavior = "open_current",
                filtered_items = {
                    visible = false, -- when true, they will just be displayed differently than normal items
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                },
            },
            default_component_configs = {
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                    -- then these will never be used.
                    default = "*",
                    highlight = "NeoTreeFileIcon",
                },
                modified = {
                    symbol = "[+]",
                    highlight = "NeoTreeModified",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added = "✚",
                        deleted = "✖",
                        modified = "",
                        renamed = "r",
                        -- Status type
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
        },
        config = function(_, opts)
            require("neo-tree").setup(opts)
        end,
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
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        cmd = { "Telescope" },
        keys = function(_, _) return PLUGIN_KEYMAPS.FILE_EX.finder() end,
        config = function(_, opts)
            require("telescope").setup(opts)
        end,
    },
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
    }
}
