local coverage = require("coverage")
local lazy_util = require("lazy.util")
local lazyvim_util = require("lazyvim.util")
local which_key = require("which-key")

which_key.register({
    ZA = { ":qa!<CR>", "Force quit" },

    ["<leader>"] = {
        e = { ":e! %<CR>", "Force re-open" },
        w = { ":w!<CR>", "Force write" },
        X = { ":bdelete!<CR>", "Force close" },

        f = { name = "+find" },
        fb = { lazyvim_util.telescope("buffers"), "Buffers" },
        fc = { lazyvim_util.telescope.config_files(), "Config" },
        fd = { lazyvim_util.telescope("git_status"), "Diffs" },
        ff = { lazyvim_util.telescope("files"), "Files" },
        fF = { lazyvim_util.telescope("find_files"), "All Files" },
        fr = { lazyvim_util.telescope("oldfiles"), "Recent Files" },
        ft = { "<cmd>NvimTreeToggle<cr>", "File Explorer" },
        ["f/"] = { lazyvim_util.telescope("live_grep"), "Grep" },
        ["f:"] = { lazyvim_util.telescope("command_history"), "Command History" },

        g = { name = "+git" },
        gb = { ":Git blame<CR>", "blame" },
        ge = { ":Gread<CR>", "checkout --" },
        gg = { function() lazy_util.float_term({ "lazygit" }, { border = "solid" }) end, "lazygit" },
        gl = { ":Git pull<CR>", "pull" },
        gp = { ":Git push<CR>", "push" },
        gr = { ":GRename ", "mv (filename only)" },
        gR = { ":GMove ", "mv" },
        gs = { ":Git<CR>", "status" },
        gw = { ":Gwrite<CR>", "add" },
        gx = { ":GBrowse<CR>", "browse" },
        gz = { ":Git commit<CR>", "commit" },
        ["g<C-h>"] = { ":topleft Gvdiffsplit<CR>", "diff (split left)" },
        ["g<C-j>"] = { ":belowright Gdiffsplit<CR>", "diff (split down)" },
        ["g<C-k>"] = { ":topleft Gdiffsplit<CR>", "diff (split up)" },
        ["g<C-l>"] = { ":belowright Gvdiffsplit<CR>", "diff (split right)" },

        l = { "<cmd>Lazy<CR>", "LazyVim" },

        m = { "<cmd>Mason<CR>", "Mason" },

        t = { name = "+test" },
        ["t]c"] = { function() coverage.jump_next("covered") end, "Next covered" },
        ["t[c"] = { function() coverage.jump_prev("covered") end, "Previous covered" },
        ["t]p"] = { function() coverage.jump_next("partial") end, "Next partially covered" },
        ["t[p"] = { function() coverage.jump_prev("partial") end, "Previous partially covered" },
        ["t]u"] = { function() coverage.jump_next("uncovered") end, "Next uncovered" },
        ["t[u"] = { function() coverage.jump_prev("uncovered") end, "Previous uncovered" },

        ["<C-h>"] = { ":topleft vsplit<CR>", "Split left" },
        ["<C-j>"] = { ":belowright split<CR>", "Split down" },
        ["<C-k>"] = { ":topleft split<CR>", "Split up" },
        ["<C-l>"] = { ":belowright vsplit<CR>", "Split right" },
    },
})
