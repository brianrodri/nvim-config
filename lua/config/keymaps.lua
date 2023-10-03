local function keymap(mode, binding, operation, input_opts)
    local opts = { noremap = true, silent = true }
    if input_opts then
        opts = vim.tbl_extend("force", opts, input_opts)
    end
    vim.api.nvim_set_keymap(mode, binding, operation, opts)
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
