local coverage = require("coverage")
local lazy_util = require("lazy.util")
local lazyvim_util = require("lazyvim.util")
local which_key = require("which-key")

local which_key_mappings = {
    ZA = { ":qa!<CR>", "Force quit" },

    ["<leader>"] = {
        e = { ":e! %<CR>", "Force re-open" },
        w = { ":w!<CR>", "Force write" },
        X = { ":bdelete!<CR>", "Force close" },

        f = { name = "+find" },
        fc = { lazyvim_util.telescope.config_files(), "Config" },
        fd = { lazyvim_util.telescope("git_status"), "Diffs" },
        ff = { lazyvim_util.telescope("files"), "Files" },
        fF = { lazyvim_util.telescope("find_files"), "All Files" },
        fr = { lazyvim_util.telescope("oldfiles"), "Recent files" },
        ft = { ":Neotree toggle<CR>", "Neotree" },
        fg = { ":Neotree git_status toggle<CR>", "Neotree" },
        fb = { ":Neotree buffers toggle<CR>", "Neotree" },
        ["f/"] = { lazyvim_util.telescope("live_grep"), "Grep" },
        ["f:"] = { lazyvim_util.telescope("command_history"), "Command History" },

        gg = { function() lazy_util.float_term("lazygit") end, "lazygit" },

        l = { name = "+lazy" },
        ll = { ":Lazy<CR>", "LazyVim" },
        le = { ":LazyExtras<CR>", "LazyExtras" },

        t = { name = "+test" },
        ["tt"] = { function() require("neotest").run.run() end, "Run Nearest" },
        ["tT"] = { function() require("neotest").run.run(vim.fn.expand("%")) end, "Run File" },
        ["tg"] = { function() require("neotest").run.run(vim.uv.cwd()) end, "Run All Test Files" },

        ["t]"] = { name = "+test-coverage" },
        ["t]c"] = { function() coverage.jump_next("covered") end, "Next covered" },
        ["t]p"] = { function() coverage.jump_next("partial") end, "Next partially covered" },
        ["t]u"] = { function() coverage.jump_next("uncovered") end, "Next uncovered" },

        ["t["] = { name = "+test-coverage" },
        ["t[c"] = { function() coverage.jump_prev("covered") end, "Prev covered" },
        ["t[p"] = { function() coverage.jump_prev("partial") end, "Prev partially covered" },
        ["t[u"] = { function() coverage.jump_prev("uncovered") end, "Prev uncovered" },

        ["<C-h>"] = { ":topleft vsplit<CR>", "Split left" },
        ["<C-j>"] = { ":belowright split<CR>", "Split down" },
        ["<C-k>"] = { ":topleft split<CR>", "Split up" },
        ["<C-l>"] = { ":belowright vsplit<CR>", "Split right" },
    },
}

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            which_key.setup({ plugins = { spelling = true } })
            which_key.register(which_key_mappings)
        end,
    },
}
