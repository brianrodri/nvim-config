local function keymap(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        if opts.remap and not vim.g.vscode then
            opts.remap = nil
        end
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

-- Quick commands
keymap("n", "<leader>w", ":w!<CR>")
keymap("n", "<leader>e", ":e! %<CR>")
keymap("n", "ZA", ":qa!<CR>")

-- Window splitting
keymap("n", "<leader><C-h>", ":topleft vsplit<CR>")
keymap("n", "<leader><C-j>", ":belowright split<CR>")
keymap("n", "<leader><C-k>", ":topleft split<CR>")
keymap("n", "<leader><C-l>", ":belowright vsplit<CR>")

-- Buffer navigation
keymap("n", "]b", "<cmd>bnext<cr>")
keymap("n", "[b", "<cmd>bprevious<cr>")

-- Open LazyVim
keymap("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Force format
keymap({ "n", "v" }, "<leader><C-f>", function()
    require("lazyvim.plugins.lsp.format").format({ force = true })
end, { desc = "Format" })

-- lazygit
keymap("n", "<leader>gg", function()
    local util = require("lazyvim.util")
    util.float_term({ "lazygit" }, { cwd = util.get_root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })
