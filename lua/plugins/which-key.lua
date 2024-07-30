local lazy_util = require("lazy.util")
local lazyvim_util = require("lazyvim.util")
local which_key = require("which-key")

local which_key_mappings = {
    { "ZA", ":qa!<CR>", desc = "force quit" },

    { "<leader><C-h>", ":topleft vsplit<CR>", desc = "split left" },
    { "<leader><C-j>", ":belowright split<CR>", desc = "split down" },
    { "<leader><C-k>", ":topleft split<CR>", desc = "split up" },
    { "<leader><C-l>", ":belowright vsplit<CR>", desc = "split right" },
    { "<leader>X", ":bdelete!<CR>", desc = "force close" },
    { "<leader>e", ":e! %<CR>", desc = "force re-open" },
    { "<leader>w", ":w!<CR>", desc = "force write" },

    { "<leader>f", group = "find" },
    { "<leader>f/", lazyvim_util.pick("live_grep"), desc = "grep" },
    { "<leader>f:", lazyvim_util.pick("command_history"), desc = "command history" },
    { "<leader>ff", lazyvim_util.pick("find_files"), desc = "files" },
    { "<leader>fc", lazyvim_util.pick.config_files(), desc = "config files" },
    { "<leader>fr", lazyvim_util.pick("oldfiles"), desc = "recent files" },
    { "<leader>fg", lazyvim_util.pick("git_status"), desc = "git-status files" },

    { "<leader>g", group = "git" },
    { "<leader>gg", function() lazy_util.float_term("lazygit") end, desc = "lazygit" },

    { "<leader>l", group = "lazyvim" },
    { "<leader>le", ":LazyExtras<CR>", desc = "extras" },
    { "<leader>ll", ":Lazy<CR>", desc = "lazyvim" },

    { "<leader>t", group = "test" },
    { "<leader>tt", function() require("neotest").run.run() end, desc = "nearest" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "file" },
    { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "all" },

    { "co", group = "toggle" },
    { "cot", ":Neotree toggle filesystem<CR>", desc = "filesystem" },
    { "cob", ":Neotree toggle buffers<CR>", desc = "buffers" },
    { "cos", ":Neotree toggle git_status<CR>", desc = "git-status files" },
    { "cof", function() vim.b.autoformat = not vim.b.autoformat end, desc = "auto-format" },
    { "coh", function() vim.o.hlsearch = not vim.o.hlsearch end, desc = "highlight search" },
    { "coy", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({})) end, desc = "inlay hints" },

    { "[o", group = "enable" },
    { "[ot", ":Neotree focus filesystem<CR>", desc = "filesystem" },
    { "[ob", ":Neotree focus buffers<CR>", desc = "buffers" },
    { "[os", ":Neotree focus git_status<CR>", desc = "git-status files" },
    { "[of", function() vim.b.autoformat = true end, desc = "auto-format" },
    { "[oh", function() vim.o.hlsearch = true end, desc = "highlight search" },
    { "[oy", function() vim.lsp.inlay_hint.enable(true) end, desc = "inlay hints" },

    { "]o", group = "disable" },
    { "]ot", ":Neotree close filesystem<CR>", desc = "filesystem" },
    { "]ob", ":Neotree close buffers<CR>", desc = "buffers" },
    { "]os", ":Neotree close git_status<CR>", desc = "git-status files" },
    { "]of", function() vim.b.autoformat = false end, desc = "auto-format" },
    { "]oh", function() vim.o.hlsearch = false end, desc = "highlight search" },
    { "]oy", function() vim.lsp.inlay_hint.enable(false) end, desc = "inlay hints" },
}

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            which_key.setup({ plugins = { spelling = true } })
            which_key.add(which_key_mappings)
        end,
    },
}
