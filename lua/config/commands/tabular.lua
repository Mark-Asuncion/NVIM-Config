vim.api.nvim_create_user_command("Tabular", function(args)
    local sep = args.args
    local line1 = args.line1
    local line2 = args.line2
    local range = args.range
    if range == 0 then
        vim.print("Tabular only works on visual mode")
        return
    end
    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, line1-1, line2, false)
    local sep_lines = {}

    local cols_max_chars_c = { }
    local left_pad_c = 0

    for i = 1, #lines, 1 do
        local line = lines[i]
        local a_cur_line = {}
        local last_idx = 1
        while true do
            local new_idx = string.find(line, sep, last_idx)

            local end_idx = -1
            if new_idx ~= nil then
                end_idx = new_idx-1
            end

            local col_raw = string.sub(line, last_idx, end_idx)
            local col = vim.trim(col_raw)
            local col_idx = #a_cur_line+1

            if col_idx == 1 then
                local non_whitespace_index = string.find(col_raw, "%S")
                if non_whitespace_index ~= nil then
                    left_pad_c = math.max(left_pad_c, non_whitespace_index - 1)
                else
                    left_pad_c = math.max(left_pad_c, #col_raw-1)
                end
            end

            a_cur_line[col_idx] = col
            cols_max_chars_c[col_idx] = math.max(cols_max_chars_c[col_idx] or 0, #col)
            if new_idx == nil then
                break
            end

            last_idx = new_idx+#sep
        end
        sep_lines[#sep_lines+1] = a_cur_line
    end

    local left_pad = string.rep(' ', left_pad_c)
    local new_lines = {}
    for i = 1, #sep_lines, 1 do
        local line = left_pad
        for j = 1, #sep_lines[i], 1 do
            local col = sep_lines[i][j]
            if col == nil then
                goto continue
            end
            local max_chars_in_col = cols_max_chars_c[j] or 0
            local pad = string.rep(' ', max_chars_in_col - #col)
            col = col .. pad

            line = line .. col
            if j < #sep_lines[i] then
                line = line .. ' ' .. sep .. ' '
            end
            ::continue::
        end
        new_lines[#new_lines+1] = vim.fn.trim(line, "", 2)
    end

    vim.api.nvim_buf_set_lines(buf, line1-1, line2, true, new_lines)
end, {
    range=true,
    desc="tabulates the selected lines. The <arg> can be a any character",
    nargs=1,
    complete= function(_argLead, _cmdLine, _cursorPos)
        return { "=", ",", ":", "|" }
    end
})
