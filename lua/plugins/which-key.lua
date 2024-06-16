local lazy_util = require("lazy.util")
local lazyvim_util = require("lazyvim.util")
local which_key = require("which-key")

local which_key_mappings = {
    ZA = { ":qa!<CR>", "Force quit" },

    ["[o"] = { name = "+Enable options" },
    ["[oh"] = { function() vim.o.hlsearch = true end, "Enable highlight search" },
    ["[of"] = { function() vim.b.autoformat = true end, "Enable auto-format" },
    ["[ot"] = { function() vim.lsp.inlay_hint.enable(true) end, "Enable inlay hints" },

    ["]o"] = { name = "+Disable options" },
    ["]oh"] = { function() vim.o.hlsearch = false end, "Disable highlight search" },
    ["]of"] = { function() vim.b.autoformat = false end, "Disable auto-format" },
    ["]ot"] = { function() vim.lsp.inlay_hint.enable(false) end, "Disable inlay hints" },

    ["<leader>"] = {
        e = { ":e! %<CR>", "Force re-open" },
        w = { ":w!<CR>", "Force write" },
        X = { ":bdelete!<CR>", "Force close" },

        f = { name = "+find" },
        fc = { lazyvim_util.pick.config_files(), "Config" },
        fd = { lazyvim_util.pick("git_status"), "Diffs" },
        ff = { lazyvim_util.pick("files"), "Files" },
        fF = { lazyvim_util.pick("find_files"), "All Files" },
        fr = { lazyvim_util.pick("oldfiles"), "Recent files" },
        ft = { ":Neotree toggle<CR>", "Neotree" },
        fg = { ":Neotree git_status toggle<CR>", "Neotree" },
        fb = { ":Neotree buffers toggle<CR>", "Neotree" },
        ["f/"] = { lazyvim_util.pick("live_grep"), "Grep" },
        ["f:"] = { lazyvim_util.pick("command_history"), "Command History" },

        gg = { function() lazy_util.float_term("lazygit") end, "lazygit" },

        l = { name = "+lazy" },
        ll = { ":Lazy<CR>", "LazyVim" },
        le = { ":LazyExtras<CR>", "LazyExtras" },

        t = { name = "+test" },
        ["tt"] = { function() require("neotest").run.run() end, "Run Nearest" },
        ["tT"] = { function() require("neotest").run.run(vim.fn.expand("%")) end, "Run File" },
        ["tg"] = { function() require("neotest").run.run(vim.uv.cwd()) end, "Run All Test Files" },

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
