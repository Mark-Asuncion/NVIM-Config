vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(_)
        vim.api.nvim_create_user_command("Fmt",
            function() vim.lsp.buf.format() end
                ,{})
    end,
})
vim.api.nvim_create_autocmd({'BufEnter', 'BufFilePost' }, {
    pattern = {"*.cpp", "*.c", "*.hpp", "*.h"},
    callback = function(args)
        vim.api.nvim_buf_set_option(args.buf, "commentstring", "// %s")
    end,
})
