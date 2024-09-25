local cmp = require("cmp")
local lazy_view = require("lazy.view")
local lazyvim_util = require("lazyvim.util")
local neotest = require("neotest")
local tmux = require("tmux")
local which_key = require("which-key")

--- @type wk.Spec
local which_key_mappings = {
    { "<M-space>", cmp.complete, mode = "i" },

    { "<leader><C-h>", ":topleft vsplit<CR>", desc = "split left" },
    { "<leader><C-j>", ":belowright split<CR>", desc = "split down" },
    { "<leader><C-k>", ":topleft split<CR>", desc = "split up" },
    { "<leader><C-l>", ":belowright vsplit<CR>", desc = "split right" },
    { "<leader>x", ":bdelete!<CR>", desc = "force close" },
    { "<leader>e", ":e! %<CR>", desc = "force re-open" },
    { "<leader>w", ":w!<CR>", desc = "force write" },
    { "<leader>q", ":qa!<CR>", desc = "force quit" },

    { "<leader>f", group = "find" },
    { "<leader>f/", lazyvim_util.pick("live_grep"), desc = "grep" },
    { "<leader>f:", lazyvim_util.pick("command_history"), desc = "command history" },
    { "<leader>ff", lazyvim_util.pick("find_files"), desc = "files" },
    { "<leader>fc", lazyvim_util.pick.config_files(), desc = "config files" },
    { "<leader>fr", lazyvim_util.pick("oldfiles"), desc = "recent files" },
    { "<leader>fg", lazyvim_util.pick("git_status"), desc = "git-status files" },

    { "<leader>g", group = "git" },
    { "<leader>gg", lazyvim_util.lazygit.open, desc = "lazygit" },

    { "<leader>l", group = "lazyvim" },
    { "<leader>le", lazyvim_util.extras.show, desc = "extras" },
    { "<leader>ll", lazy_view.show, desc = "lazyvim" },

    { "<leader>t", group = "test" },
    { "<leader>tt", function() neotest.run.run() end, desc = "nearest" },
    { "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, desc = "file" },
    { "<leader>tT", function() neotest.run.run(vim.uv.cwd()) end, desc = "all" },

    { "co", group = "toggle" },
    { "cof", ":Neotree toggle filesystem<CR>", desc = "filesystem" },
    { "cob", ":Neotree toggle buffers<CR>", desc = "buffers" },
    { "cos", ":Neotree toggle git_status<CR>", desc = "git-status files" },
    { "coq", function() vim.b.autoformat = not vim.b.autoformat end, desc = "auto-format" },
    { "coh", function() vim.o.hlsearch = not vim.o.hlsearch end, desc = "highlight search" },
    { "coy", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({})) end, desc = "inlay hints" },

    { "[o", group = "enable" },
    { "[of", ":Neotree focus filesystem<CR>", desc = "filesystem" },
    { "[ob", ":Neotree focus buffers<CR>", desc = "buffers" },
    { "[os", ":Neotree focus git_status<CR>", desc = "git-status files" },
    { "[oq", function() vim.b.autoformat = true end, desc = "auto-format" },
    { "[oh", function() vim.o.hlsearch = true end, desc = "highlight search" },
    { "[oy", function() vim.lsp.inlay_hint.enable(true) end, desc = "inlay hints" },

    { "]o", group = "disable" },
    { "]of", ":Neotree close filesystem<CR>", desc = "filesystem" },
    { "]ob", ":Neotree close buffers<CR>", desc = "buffers" },
    { "]os", ":Neotree close git_status<CR>", desc = "git-status files" },
    { "]oq", function() vim.b.autoformat = false end, desc = "auto-format" },
    { "]oh", function() vim.o.hlsearch = false end, desc = "highlight search" },
    { "]oy", function() vim.lsp.inlay_hint.enable(false) end, desc = "inlay hints" },

    { "<M-h>", tmux.resize_left, desc = "resize left" },
    { "<M-j>", tmux.resize_bottom, desc = "resize bottom" },
    { "<M-k>", tmux.resize_top, desc = "resize top" },
    { "<M-l>", tmux.resize_right, desc = "resize right" },
}

return vim.g.vscode and {}
    or {
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            config = function()
                which_key.setup({ plugins = { spelling = true } })
                which_key.add(which_key_mappings)
            end,
        },
    }
