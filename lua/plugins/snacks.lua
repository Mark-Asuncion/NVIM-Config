local PLUGIN_KEYMAPS = require("config.plugins.keymaps")
return {
    {
        "folke/snacks.nvim",
        opts = {
            picker = {
                sources = {
                    explorer = {
                        auto_close = true,
                    }
                }
            }
        },
        config = function(_, opts)
            require("snacks").setup(opts)
            PLUGIN_KEYMAPS.Snacks.setup()
        end
    }
}
