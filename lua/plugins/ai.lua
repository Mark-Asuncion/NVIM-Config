return {
    'kkrampis/codex.nvim',
    lazy = true,
    cmd = { 'Codex', 'CodexToggle' }, -- Optional: Load only on command execution
    opts = {
        border      = 'rounded',  -- Options: 'single', 'double', or 'rounded'
        width       = 0.8,        -- Width of the floating window (0.0 to 1.0)
        height      = 0.8,        -- Height of the floating window (0.0 to 1.0)
        autoinstall = true,       -- Automatically install the Codex CLI if not found
        panel       = true,      -- Open Codex in a side-panel (vertical split) instead of floating window
        use_buffer  = false,      -- Capture Codex stdout into a normal buffer instead of a terminal buffer
    },
}
