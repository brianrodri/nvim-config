local coverage = require("coverage")
local lazy_util = require("lazy.util")
local lazyvim_util = require("lazyvim.util")
local which_key = require("which-key")

which_key.register({
    ZA = { ":qa!<CR>", "Force quit" },

    ["]b"] = { "<cmd>bnext<CR>", "Next buffer" },
    ["[b"] = { "<cmd>bprevious<CR>", "Previous buffer" },

    ["<leader>"] = {
        e = { ":e! %<CR>", "Force re-open" },

        gg = {
            function()
                lazy_util.float_term(
                    { "lazygit" },
                    { cwd = lazyvim_util.root.get(), esc_esc = false, ctrl_hjkl = false }
                )
            end,
            "Lazygit",
        },

        l = { "<cmd>Lazy<CR>", "LazyVim" },

        w = { ":w!<CR>", "Force write" },

        T = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },

        ["?"] = { name = "+coverage" },
        ["?cn"] = { function() coverage.jump_next("covered") end, "Next covered" },
        ["?cp"] = { function() coverage.jump_prev("covered") end, "Previous covered" },
        ["?un"] = { function() coverage.jump_next("uncovered") end, "Next uncovered" },
        ["?up"] = { function() coverage.jump_prev("uncovered") end, "Previous uncovered" },
        ["?pn"] = { function() coverage.jump_next("partial") end, "Next partially covered" },
        ["?pp"] = { function() coverage.jump_prev("partial") end, "Previous partially covered" },

        ["<C-f>"] = { ":LazyFormat<CR>", "LazyFormat" },

        ["<C-h>"] = { ":topleft vsplit<CR>", "Split left" },
        ["<C-j>"] = { ":belowright split<CR>", "Split down" },
        ["<C-k>"] = { ":topleft split<CR>", "Split up" },
        ["<C-l>"] = { ":belowright vsplit<CR>", "Split right" },
    },
})
