return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        event = { "BufWinEnter" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            {
                "<leader>e",
                "<cmd>Neotree toggle float reveal position=float<cr>",
                desc = "Toggle NeoTree",
            },
        },
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
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files({
                        no_ignore = false,
                        no_ignore_parent = false,
                    })
                end,
                desc = "Telescope Files"
            },
            {
                "<leader>fF",
                function()
                    require("telescope.builtin").git_files({
                        no_ignore = false,
                        no_ignore_parent = false,
                    })
                end,
                desc = "Telescope Git Files"
            },
            {
                "<leader>fh",
                function()
                    require("telescope.builtin").find_files({
                        hidden = true,
                        no_ignore = true,
                        no_ignore_parent = true,
                    })
                end,
                desc = "Telescope Files (Includes hidden)"
            },
            {
                "<leader>fs",
                function()
                    require("telescope.builtin").treesitter()
                end,
                desc = "Telescope Symbols"
            },
            {
                "<leader>fb",
                function()
                    require("telescope.builtin").buffers({
                        ignore_current_buffer = true,
                        sort_lastused = true,
                        sort_mru = true,
                    })
                end,
                desc = "Telescope Buffers"
            },
            {
                "<leader>fB",
                function()
                    require("telescope.builtin").current_buffer_fuzzy_find()
                end,
                desc = "Telescope Live Grep on Current Buffer"
            },
            {
                "<leader>fgs",
                function()
                    require("telescope.builtin").git_status()
                end,
                desc = "Telescope Git Status"
            },
            {
                "<leader>fgb",
                function()
                    require("telescope.builtin").git_branches()
                end,
                desc = "Telescope Git Branches"
            },
            {
                "<leader>fG",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Telescope Live Grep"
            }
        },
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
        keys = {
            {
                "]h",
                "<cmd>Gitsigns next_hunk<cr>",
                desc = "Git next hunk"
            },
            {
                "[h",
                "<cmd>Gitsigns prev_hunk<cr>",
                desc = "Git prev hunk"
            }
        },
        config = function()
            require("gitsigns").setup()
            vim.api.nvim_create_user_command("Gitblame", "Gitsigns blame_line",{ desc = "Git Blame" })
            vim.api.nvim_create_user_command("GitTogblame", "Gitsigns toggle_current_line_blame",{ desc = "Git Toggle Blame" })
        end
    }
}
