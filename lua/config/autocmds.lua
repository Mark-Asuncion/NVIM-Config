-- vim.api.nvim_create_autocmd({'BufEnter', 'BufFilePost' }, {
--     pattern = {"*.cpp", "*.c", "*.hpp", "*.h"},
--     callback = function(args)
--         vim.api.nvim_buf_set_option(args.buf, "commentstring", "// %s")
--     end,
-- })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function(_)
        vim.highlight.on_yank{
            higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0
                and 'HighlightedyankRegion' or 'IncSearch'),
            timeout=150 }
    end,
})
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function(_)
        local cwd = vim.fn.getcwd()
        local vimrclua = cwd .. "/.vimrc.lua"
        local vimrc = cwd .. "/.vimrc"
        if vim.fn.filereadable(vimrclua) == 1 then
            vim.cmd("silent! source" .. vimrclua)
        elseif vim.fn.filereadable(vimrc) == 1 then
            vim.cmd("silent! source" .. vimrc)
        end
    end,
})
