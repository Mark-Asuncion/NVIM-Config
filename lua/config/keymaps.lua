vim.g.mapleader=" "
vim.keymap.set('t','<C-BS>','<C-\\><C-n>',{})
vim.keymap.set({'n','i', 'v'},'<A-a>', '<Esc>',{})
-- movement
vim.keymap.set({'n','v'},'j', 'gj',{})
vim.keymap.set({'n','v'},'k', 'gk',{})
-- selection
-- vim.keymap.set('n','<leader>V', 'v$h',{})
-- copy and pasting
vim.keymap.set('n','<leader>ay', '<cmd>%y+<CR>',{})
vim.keymap.set('n','<leader>Y', '"+y$',{})
vim.keymap.set('v','<leader>y', '"+y',{})
vim.keymap.set({'n','v'},'<leader>p', '"+p',{})
vim.keymap.set({'n','v'},'<leader>P', '"+P',{})
-- vim.keymap.set('v','p','"0p',{})
-- vim.keymap.set('v','P','"0P',{})
-- buffer
vim.keymap.set('n','<S-h>', '<cmd>bp<CR>',{})
vim.keymap.set('n','<S-l>', '<cmd>bn<CR>',{})
vim.keymap.set('n','<leader>w','<cmd>bw<CR>',{})
vim.keymap.set('n','<leader>W','<cmd>bw!<CR>',{})
vim.api.nvim_create_autocmd({ 'BufEnter','BufWinEnter' }, {
    callback = function(_)
        if vim.bo.buftype == "help" or vim.bo.buftype == "quickfix" then
            vim.keymap.set('n','q','<cmd>bw<cr>',{ noremap=true, buffer=true })
        end
    end,
})
-- quickfix navi
vim.keymap.set('n','<C-j>','<cmd>cn<CR>',{})
vim.keymap.set('n','<C-k>','<cmd>cp<CR>',{})
-- scrolling
-- vim.keymap.set('n','<A-j>', '10j',{})
-- vim.keymap.set('n','<A-k>', '10k',{})
vim.keymap.set('n','<C-d>','<C-d>zz',{})
vim.keymap.set('n','<C-u>','<C-u>zz',{})
-- resizing windows
vim.keymap.set('n','<A-Left>','<cmd>vertical resize -5<cr>',{})
vim.keymap.set('n','<A-Right>','<cmd>vertical resize +5<cr>',{})
vim.keymap.set('n','<A-Up>','<cmd>resize +5<cr>',{})
vim.keymap.set('n','<A-Down>','<cmd>resize -5<cr>',{})

vim.api.nvim_create_user_command("GrepWord",function(_)
    local word = vim.fn.expand("<cword>")
    if string.len(word) == 0 or true then
        return
    end
    vim.cmd("grep " .. word .. '%')
end, {
        desc     = "Grep word under cursor",
        nargs    = 0,
        range    = true
})

vim.api.nvim_create_user_command("Wrap", function()
        vim.o.wrap = not vim.o.wrap
    end,{})

vim.api.nvim_create_user_command("Trim", function(args)
    local range = args.range
    local selected = [['<,'>]]
    if range == 0 then
        local win_cursor = vim.api.nvim_win_get_cursor(0)
        selected = win_cursor[1]
    end

    local arg = args.args
    local pattern = ""

    if arg == 'b' then
        pattern = [[^\s*\(.\{-}\)\s*$]]
    elseif arg == 'l' then
        pattern = [[^\s*]]
    else
        pattern = [[\s*$]]
    end

    if arg == 'b' then
        vim.cmd( selected .. "s#" .. pattern .. "#" .. [[\1]])
    else
        vim.cmd( selected .. "s#" .. pattern .. "#")
    end

end,{
    range = true,
    nargs = '?',
    desc = "Trim the selection or current line. Defaults to trim right pass `l` to trim left or `b` to trim both"
})

vim.api.nvim_create_user_command("CpFileCWD","let @+ = expand(\"%\")",{ desc = "Copy Filename path relative to cwd" })

vim.api.nvim_create_user_command("CpFileRoot","let @+ = expand(\"%:p\")",{ desc = "Copy Filename path from root" })

vim.api.nvim_create_user_command("SetTab", function(args)
    local w = args.args
    if w == '' then
        return vim.g.setTab(4)
    end
    local tab = tonumber(w)
    if tab == nil then
        vim.notify("Argument " .. w .. " is not a number", vim.log.levels.ERROR)
        return
    end
    if tab == 0 then
        return vim.g.setTab(4)
    end
    vim.o.tabstop=tab
    vim.o.shiftwidth=tab
end,{ nargs='?' })

vim.api.nvim_create_user_command("Tabular", function(args)
    local line1 = args.line1
    local line2 = args.line2
    local range = args.range
    if range == 0 then
        return
    end
    local function char_repeat(c, n)
        local st = ''
        for _=1, n, 1 do
            st = st .. c
        end
        return st
    end

    local function is_colon_sep(s, st)
        local c = string.find(s, "%s*:", st+1)
        return c == nil
    end

    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, line1-1, line2, false)
    local seps = { '=', ':' }
    local M = {}
    local curr_line = line1
    local tab_size = vim.o.tabstop
    local longest = -1
    for i = 1, #lines, 1 do
        local line = lines[i]

        local n_line = line
        local n_st = nil

        for j = 1, #seps, 1 do
            local st = string.find(line, seps[j])
            local col_sep = ( seps[j] == ':' and st ~=nil and is_colon_sep(line, st) )
            local other_sep = ( st ~= nil and seps[j] ~= ':' )
            if other_sep or col_sep then
                local w1 = string.sub(line, 1, st-1)
                w1 =  string.gsub(w1, "%s+$", "")
                local w2 = string.sub(line, st+1)
                n_line = w1 .. char_repeat(' ', tab_size) .. seps[j]
                st =  #n_line
                w2 = ' ' .. string.gsub(w2, "^%s+", "")
                n_line = n_line .. w2
                n_st = st
                lines[i] = n_line
                break
            else
                st = string.find(line, "%w%s")
                if st ~= nil then
                    local w1 = string.sub(line, 1, st)
                    local w2 = string.sub(line, st+1)
                    w2 = string.gsub(w2, "^%s+", "")
                    n_line = w1 .. char_repeat(' ', tab_size)
                    n_st = #n_line + 1
                    n_line = n_line .. w2
                    lines[i] = n_line
                end
            end
        end
        M[curr_line] = {
            v      = n_line,
            start  = n_st,
        }
        if M[curr_line].start ~= nil and M[curr_line].start > longest then
            longest = M[curr_line].start
        end
        curr_line = curr_line + 1
    end
    local replacement = {}

    local function insert_space(s, amount, split_pos)
        local w1 = string.sub(s, 1, split_pos-1)
        local w2 = string.sub(s, split_pos)
        return w1 .. char_repeat(' ', amount) .. w2
    end

    local is_not_change_c = 0
    for i=line1, line2, 1 do
        local v = M[i]
        if v.start ~= nil then
            local n_add = longest - v.start
            if n_add ~= 0 then
                local l = v.v
                v.v = insert_space(l, n_add, v.start)
            end
        end
        if v.v == lines[i-line1+1] then
            is_not_change_c = is_not_change_c + 1
        end
        table.insert(replacement, v.v)
    end
    if is_not_change_c == line2-line1+1 then
        vim.print("no changes")
        return
    end
    vim.api.nvim_buf_set_lines(buf, line1-1, line2, true, replacement)
end, { range=true })

vim.api.nvim_create_user_command("Separate", function(args)
    local w = args.args
    local line1 = args.line1
    local line2 = args.line2
    local sep = ','
    if w ~= '' then
        sep = w
    end

    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, line1-1, line2, false)
    local M = {}

    for i=1, #lines, 1 do
        local line = lines[i]
        ::iterate::
        local pos = string.find(line, sep .. '.')
        if pos ~= nil then
            local l = string.sub(line, 1, pos)
            local rem = string.sub(line, pos+1)
            l = string.match(l, '%g.*$')
            table.insert(M, l)
            line = rem
            goto iterate
        else
            line = string.match(line, '%g.*$')
            table.insert(M, line)
        end
    end

    if #lines == #M then
        return
    end

    vim.api.nvim_buf_set_lines(buf, line1-1, line2, true, M)
    vim.cmd(':' .. line1 .. ' | :normal =' .. #M-1 .. 'j')
end,{ nargs='?', range=true })

-- LSP KEYMAPS
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', ']e', function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set('n', '[e', function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set('n', ']w', function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
end)
vim.keymap.set('n', '[w', function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
end)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
})

vim.api.nvim_create_user_command("WorkspaceAdd", vim.lsp.buf.add_workspace_folder, {})
vim.api.nvim_create_user_command("WorkspaceRm", vim.lsp.buf.remove_workspace_folder, {})
vim.api.nvim_create_user_command("WorkspaceList", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, {})
vim.api.nvim_create_user_command("Format", function(arg)
    local function selRange()
        if arg.range == 0 then
            return nil
        end
        return {
            ["start"] = { arg.line1, 0 },
            ["end"] = { arg.line2, 0 }
        }
    end
    vim.lsp.buf.format({
        buffer = 0,
        async = true,
        range = selRange()
    })
end, { range = true })

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local aug_opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, aug_opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, aug_opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, aug_opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, aug_opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, aug_opts)
        vim.keymap.set('n', '<leader>ck', vim.lsp.buf.signature_help, aug_opts)
        vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, aug_opts)
        vim.keymap.set('n', '<leader>cD', vim.lsp.buf.type_definition, aug_opts)
        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, aug_opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, aug_opts)
    end
})
