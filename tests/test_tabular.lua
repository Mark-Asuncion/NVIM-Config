T = MiniTest.new_set()
T['Tabular_1'] = function()
    local buf_id = vim.api.nvim_create_buf(false, true)
    local lines = {
        "ignore this line",
        "a  =    sddd",
        "assd =  sdads",
        "ignore this line"
    };
    local expected = {
        "ignore this line",
        "a    = sddd",
        "assd = sdads",
        "ignore this line"
    }

    vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)
    vim.api.nvim_buf_call(buf_id, function() 
        vim.cmd("2,3Tabular =")
    end)
    local buf_lines = vim.api.nvim_buf_get_lines(buf_id, 0, -1, false)

    MiniTest.expect.equality(expected, buf_lines)
end

T['Tabular_2'] = function()
    local buf_id = vim.api.nvim_create_buf(false, true)
    local lines = {
        "ignore this line",
        "a  =    sddd",
        "      a  =    sddd = asda",
        "    assd =  sdads    =sd "
    };
    local expected = {
        "ignore this line",
        "a  =    sddd",
        "      a    = sddd  = asda",
        "      assd = sdads = sd"
    }

    vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)
    vim.api.nvim_buf_call(buf_id, function() 
        vim.cmd("3,4Tabular =")
    end)
    local buf_lines = vim.api.nvim_buf_get_lines(buf_id, 0, -1, false)

    MiniTest.expect.equality(expected, buf_lines)
end

T['Tabular_3'] = function()
    local buf_id = vim.api.nvim_create_buf(false, true)
    local lines = {
        "ignore this line",
        "a  |    sddd",
        " |     a  |    sddd | asda",
        " |   assd |  sdads    |sd "
    };
    local expected = {
        "ignore this line",
        "a  |    sddd",
        " | a    | sddd  | asda",
        " | assd | sdads | sd"
    }

    vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)
    vim.api.nvim_buf_call(buf_id, function() 
        vim.cmd("3,4Tabular |")
    end)
    local buf_lines = vim.api.nvim_buf_get_lines(buf_id, 0, -1, false)

    MiniTest.expect.equality(expected, buf_lines)
end

-- add more

return T
