return {
    {
        "tpope/vim-fugitive",
        event = { "CursorHold", "InsertEnter" },
    },
    {
        "mhartington/formatter.nvim",
        event = { "InsertEnter" },
        config = function ()
            -- Utilities for creating configurations
            -- local util = require "formatter.util"
            -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
            require("formatter").setup {
                logging = true,
                log_level = vim.log.levels.WARN,
                -- All formatter configurations are opt-in
                filetype = {
                    json = { require("formatter.filetypes.json").prettier, },
                    python = { require("formatter.filetypes.python").black, },
                    ["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
                },
            }
        end
    },
    {
        "mbbill/undotree",
        event = { "InsertEnter" },
        config = function()
            vim.keymap.set('n', '<F5>', vim.cmd.UndotreeToggle)
        end,
    },
    {
        "ThePrimeagen/harpoon",
        -- opts = {
        --     tabline = true,
        --     tabline_prefix = "   ",
        --     tabline_suffix = "   ",
        -- },
        config = function(_,opts)
            vim.keymap.set('n','<leader>ha',
                ':lua require("harpoon.mark").add_file()<cr>',
                {
                    desc = "Harpoon Add",
                    silent = true,
                })
            vim.keymap.set('n','<leader>hh',
                ':lua require("harpoon.ui").toggle_quick_menu()<cr>',
                {
                    desc = "Harpoon Quick Menu",
                    silent = true,
                })
            vim.keymap.set('n','<leader>j',
                ':lua require("harpoon.ui").nav_next()<cr>',
                {
                    desc = "Harpoon Next",
                    silent = true,
                })
            vim.keymap.set('n','<leader>k',
                ':lua require("harpoon.ui").nav_prev()<cr>',
                {
                    desc = "Harpoon Prev",
                    silent = true,
                })
            return opts
        end,
    },
}
