local lazy_util = require("lazy.util")
local lazyvim_util = require("lazyvim.util")
local which_key = require("which-key")

local which_key_mappings = {
    { "<leader><C-h>", ":topleft vsplit<CR>", desc = "Split left" },
    { "<leader><C-j>", ":belowright split<CR>", desc = "Split down" },
    { "<leader><C-k>", ":topleft split<CR>", desc = "Split up" },
    { "<leader><C-l>", ":belowright vsplit<CR>", desc = "Split right" },
    { "<leader>X", ":bdelete!<CR>", desc = "Force close" },
    { "<leader>e", ":e! %<CR>", desc = "Force re-open" },
    { "<leader>f", group = "find" },
    { "<leader>f/", lazyvim_util.pick("live_grep"), desc = "Grep" },
    { "<leader>f:", lazyvim_util.pick("command_history"), desc = "Command History" },
    { "<leader>fF", lazyvim_util.pick("find_files"), desc = "All Files" },
    { "<leader>fb", ":Neotree buffers toggle<CR>", desc = "Neotree" },
    { "<leader>fc", lazyvim_util.pick.config_files(), desc = "Config" },
    { "<leader>fd", lazyvim_util.pick("git_status"), desc = "Diffs" },
    { "<leader>ff", lazyvim_util.pick("files"), desc = "Files" },
    { "<leader>fg", ":Neotree git_status toggle<CR>", desc = "Neotree" },
    { "<leader>fr", lazyvim_util.pick("oldfiles"), desc = "Recent files" },
    { "<leader>ft", ":Neotree toggle<CR>", desc = "Neotree" },
    { "<leader>gg", function() lazy_util.float_term("lazygit") end, desc = "lazygit" },
    { "<leader>l", group = "lazy" },
    { "<leader>le", ":LazyExtras<CR>", desc = "LazyExtras" },
    { "<leader>ll", ":Lazy<CR>", desc = "LazyVim" },
    { "<leader>t", group = "test" },
    { "<leader>tT", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
    { "<leader>tg", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files" },
    { "<leader>tt", function() require("neotest").run.run() end, desc = "Run Nearest" },
    { "<leader>w", ":w!<CR>", desc = "Force write" },
    { "ZA", ":qa!<CR>", desc = "Force quit" },
    { "[o", group = "enable" },
    { "[of", function() vim.b.autoformat = true end, desc = "auto-format" },
    { "[oh", function() vim.o.hlsearch = true end, desc = "highlight search" },
    { "[ot", function() vim.lsp.inlay_hint.enable(true) end, desc = "inlay hints" },
    { "]o", group = "disable" },
    { "]of", function() vim.b.autoformat = false end, desc = "auto-format" },
    { "]oh", function() vim.o.hlsearch = false end, desc = "highlight search" },
    { "]ot", function() vim.lsp.inlay_hint.enable(false) end, desc = "inlay hints" },
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
