return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        event = "BufEnter",
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
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            local builtin = require("telescope.builtin")
            local set = vim.keymap.set
            set("n", "<leader>ff", function()
                builtin.find_files({
                    no_ignore = false,
                    no_ignore_parent = false,
                })
            end, {})
            set("n", "<leader>fh", function()
                builtin.find_files({
                    no_ignore = true,
                    no_ignore_parent = true,
                })
            end, {})
            set("n", "<leader>fH", function()
                builtin.find_files({
                    hidden = true,
                    no_ignore = true,
                    no_ignore_parent = true,
                })
            end, {})
            set("n", "<leader>fs", builtin.treesitter, {})
            set("n", "<leader>fb", function()
                builtin.buffers({
                    cwd = vim.fn.getcwd(),
                    ignore_current_buffer = true,
                    sort_lastused = true,
                    sort_mru = true,
                })
            end, {})
            set("n", "<leader>fgs", builtin.git_status, {})
            set("n", "<leader>fgb", builtin.git_branches, {})
            set("n", "<leader>fgg", builtin.live_grep, {})
        end,
    },
    { "lukas-reineke/indent-blankline.nvim" },
}
