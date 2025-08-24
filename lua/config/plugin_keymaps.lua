local M = {}

M.LSP_RUST = {
    setup_keymap = function(bufnr)
        vim.keymap.set("n", "K",
            function()
                vim.cmd.RustLsp({"hover", "actions"})
            end,
            { silent = true, buffer = bufnr }
        )
        vim.keymap.set("n", "<leader>ca",
            function()
                vim.cmd.RustLsp("codeAction")
            end,
            { silent = true, buffer = bufnr })
    end
}

M.FILE_EX = {
    toggle_file_ex = {
        {
            "<leader>e",
            "<cmd>Neotree toggle float reveal position=float<cr>",
            desc = "Toggle NeoTree",
        },
    },
    undo = {
        { "<F5>", vim.cmd.UndotreeToggle, desc = "Undo Tree Toggle" }
    },
    finder = function()
        local telescope_builtin = require("telescope.builtin")

        vim.api.nvim_create_user_command("Find", function(args)
            local dir = args.args
            local search_dirs = nil
            if (dir ~= nil and #dir > 0) then
                if (vim.fn.isdirectory(dir) == 0) then
                    vim.notify(dir .. " is not a directory", vim.log.levels.ERROR)
                    return
                end
                search_dirs = { dir }
            end
            telescope_builtin.live_grep({
                file_encoding = "utf-8",
                search_dirs = search_dirs
            })
        end, { nargs='?', desc = "Grep on directory default 'cwd'", complete = "dir_in_path"})

        return {
            {
                "<leader>ff",
                function()
                    telescope_builtin.find_files({
                        no_ignore = false,
                        no_ignore_parent = false,
                    })
                end,
                desc = "Telescope Files"
            },
            {
                "<leader>fF",
                function()
                    telescope_builtin.git_files({
                        no_ignore = false,
                        no_ignore_parent = false,
                    })
                end,
                desc = "Telescope Git Files"
            },
            {
                "<leader>fh",
                function()
                    telescope_builtin.find_files({
                        hidden = true,
                        no_ignore = true,
                        no_ignore_parent = true,
                    })
                end,
                desc = "Telescope Files (Includes hidden)"
            },
            {
                "<leader>fs",
                function()
                    telescope_builtin.treesitter()
                end,
                desc = "Telescope Symbols"
            },
            {
                "<leader>fb",
                function()
                    telescope_builtin.buffers({
                        ignore_current_buffer = true,
                        sort_lastused = true,
                        sort_mru = true,
                    })
                end,
                desc = "Telescope Buffers"
            },
            {
                "<leader>fB",
                function()
                    telescope_builtin.current_buffer_fuzzy_find()
                end,
                desc = "Telescope Live Grep on Current Buffer"
            },
            {
                "<leader>fgs",
                function()
                    telescope_builtin.git_status()
                end,
                desc = "Telescope Git Status"
            },
            {
                "<leader>fgb",
                function()
                    telescope_builtin.git_branches()
                end,
                desc = "Telescope Git Branches"
            },
            {
                "<leader>fG",
                function()
                    telescope_builtin.live_grep()
                end,
                desc = "Telescope Live Grep"
            }
        }
    end
}

M.GIT = {
    keys = {
        {
            "]h",
            "<cmd>Gitsigns next_hunk<cr>",
            desc = "Git next hunk"
        },
        {
            "[h",
            "<cmd>Gitsigns prev_hunk<cr>",
            desc = "Git prev hunk"
        }
    }
}

return M
