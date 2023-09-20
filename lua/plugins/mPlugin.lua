return {
    {
        "tpope/vim-fugitive",
        event = { "CursorHold", "InsertEnter" },
        keys = {
            { "<cmd>Gvdiffsplit<cr>" }
        },
    },
    {
        "mbbill/undotree",
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
            vim.keymap.set('n','<A-j>',
                ':lua require("harpoon.ui").nav_next()<cr>',
                {
                    desc = "Harpoon Next",
                    silent = true,
                })
            vim.keymap.set('n','<A-k>',
                ':lua require("harpoon.ui").nav_prev()<cr>',
                {
                    desc = "Harpoon Prev",
                    silent = true,
                })
            return opts
        end,
    },
}
