return {
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen" },
    },
    {
        "mbbill/undotree",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = { "InsertEnter" },
        keys = require("config.plugin_keymaps").FILE_EX.undo,
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
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    }
}
