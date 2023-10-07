return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
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
                    highlight = "NeoTreeFileIcon"
                },
                modified = {
                    symbol = "[+]",
                    highlight = "NeoTreeModified",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "✚",
                        deleted   = "✖",
                        modified  = "",
                        renamed   = "r",
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "",
                        staged    = "",
                        conflict  = "",
                    },
                },
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin")
                    .find_files({
                        no_ignore = false,
                        no_ignore_parent = false
                    })
                end,
                desc = "Find git files"
            },
            {
                "<leader>fh",
                function()
                    require("telescope.builtin")
                    .find_files({
                        no_ignore = true,
                        no_ignore_parent = true
                    })
                    end,
                desc = "Find files"
            },
            {
                "<leader>fH",
                function()
                    require("telescope.builtin")
                    .find_files({
                        hidden = true,
                        no_ignore = true,
                        no_ignore_parent = true
                    })
                    end,
                desc = "Find files including hidden files"
            },
            {
                "<leader>fs",
                require("telescope.builtin")
                    .treesitter,
                desc = "Find Symbol"
            },
            {
                "<leader>fb",
                function()
                    require("telescope.builtin")
                    .buffers({
                        cwd = vim.fn.getcwd(),
                        ignore_current_buffer = true,
                        sort_lastused = true,
                        sort_mru = true
                    })
                end,
                desc = "Find Buffers"
            },
            {
                "<leader>fgs",
                require("telescope.builtin")
                    .git_status,
                desc = "Find Git Status"
            },
            {
                "<leader>fgb",
                require("telescope.builtin")
                    .git_branches,
                desc = "Find Git Status"
            }
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            show_current_context = true,
            show_current_context_start = true,
        },
    }
}
