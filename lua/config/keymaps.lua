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

        g = { name = "+git" },
        gb = { ":GBrowse<CR>", "browse" },
        gc = { ":Git commit<CR>", "commit" },
        ge = { ":Gread<CR>", "checkout --" },
        gg = {
            function() lazy_util.float_term({ "lazygit" }, { cwd = lazyvim_util.root.get() }) end,
            "lazygit",
        },
        gl = { ":Git pull<CR>", "pull" },
        gp = { ":Git push<CR>", "push" },
        gr = { ":GRename ", "mv (filename only)" },
        gw = { ":Gwrite<CR>", "add" },
        ["g?"] = { ":Git blame<CR>", "blame" },
        ["g<C-h>"] = { ":topleft Gvdiffsplit<CR>", "diff (split left)" },
        ["g<C-j>"] = { ":belowright Gdiffsplit<CR>", "diff (split down)" },
        ["g<C-k>"] = { ":topleft Gdiffsplit<CR>", "diff (split up)" },
        ["g<C-l>"] = { ":belowright Gvdiffsplit<CR>", "diff (split right)" },
        ["g<C-r>"] = { ":GMove ", "mv" },

        l = { "<cmd>Lazy<CR>", "LazyVim" },

        T = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },

        w = { ":w!<CR>", "Force write" },

        ["?"] = { name = "+coverage" },
        ["?cn"] = { function() coverage.jump_next("covered") end, "Next covered" },
        ["?cp"] = { function() coverage.jump_prev("covered") end, "Previous covered" },
        ["?pn"] = { function() coverage.jump_next("partial") end, "Next partially covered" },
        ["?pp"] = { function() coverage.jump_prev("partial") end, "Previous partially covered" },
        ["?un"] = { function() coverage.jump_next("uncovered") end, "Next uncovered" },
        ["?up"] = { function() coverage.jump_prev("uncovered") end, "Previous uncovered" },

        ["<C-f>"] = { ":LazyFormat<CR>", "LazyFormat" },

        ["<C-h>"] = { ":topleft vsplit<CR>", "Split left" },
        ["<C-j>"] = { ":belowright split<CR>", "Split down" },
        ["<C-k>"] = { ":topleft split<CR>", "Split up" },
        ["<C-l>"] = { ":belowright vsplit<CR>", "Split right" },
    },
})
