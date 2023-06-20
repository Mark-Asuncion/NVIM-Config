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
}
