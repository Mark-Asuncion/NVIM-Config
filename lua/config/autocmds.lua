vim.api.nvim_create_autocmd({'BufEnter', 'BufFilePost' }, {
    pattern = {"*.cpp", "*.c", "*.hpp", "*.h"},
    callback = function(args)
        vim.api.nvim_buf_set_option(args.buf, "commentstring", "// %s")
    end,
})
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function(_)
        vim.highlight.on_yank{
            higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0
                and 'HighlightedyankRegion' or 'IncSearch'),
            timeout=150 }
    end,
})
