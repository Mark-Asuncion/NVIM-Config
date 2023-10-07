return {
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen" },
    },
    {
        "mbbill/undotree",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = { "InsertEnter" },
        keys = {
            { "<F5>", vim.cmd.UndotreeToggle, desc = "Undo Tree Toggle" }
        },
    },
    {
        "ThePrimeagen/harpoon",
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
            vim.keymap.set('n','<A-Right>',
                ':lua require("harpoon.ui").nav_next()<cr>',
                {
                    desc = "Harpoon Next",
                    silent = true,
                })
            vim.keymap.set('n','<A-Left>',
                ':lua require("harpoon.ui").nav_prev()<cr>',
                {
                    desc = "Harpoon Prev",
                    silent = true,
                })
            return opts
        end,
    },
    {
        "folke/which-key.nvim",
        opts = function(_, opts)
            return opts
        end,
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
            -- "ts_context_commentstring.internal"
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
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    }
}
