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

        G = { name = "+fugitive" },
        Gs = { ":Git<CR>", "git summary" },

        Gb = { ":GBrowse<CR>", "git browse", mode = { "n", "v" } },

        Gl = { ":Git pull<CR>", "git pull" },
        Gp = { ":Git push<CR>", "git push" },

        Ge = { ":Gread<CR>", "git checkout --", mode = { "n", "v" } },
        Gw = { ":Gwrite<CR>", "git add", mode = { "n", "v" } },
        Gc = { ":Git commit<CR>", "git commit" },
        Gr = { ":GRename ", "git mv" },
        ["G<C-r>"] = { ":GMove ", "git mv" },

        ["G?"] = { ":Git blame<CR>", "git blame", mode = { "n", "v" } },

        ["G<C-h>"] = { ":topleft Gvdiffsplit<CR>", "git diff (split left)" },
        ["G<C-j>"] = { ":belowright Gdiffsplit<CR>", "git diff (split down)" },
        ["G<C-k>"] = { ":topleft Gdiffsplit<CR>", "git diff (split up)" },
        ["G<C-l>"] = { ":belowright Gvdiffsplit<CR>", "git diff (split right)" },

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
