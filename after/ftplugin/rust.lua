local LSP_RUST = require("lua.config.plugins.keymaps").LSP_RUST
local bufnr = vim.api.nvim_get_current_buf()
LSP_RUST.setup_keymap(bufnr)
