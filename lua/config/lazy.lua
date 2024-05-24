local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

vim.g.mapleader = " "

require("lazy").setup({
    spec = {
        -- Brings in a lot of cool plugins, but I don't want all of them...
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },

        -- Keeps crashing when I switch tmux windows.
        { "folke/persistence.nvim", enabled = false },
        -- I don't want a dashboard.
        { "goolord/alpha-nvim", enabled = false },
        -- Highly experimental -- not interested in breakages.
        { "folke/noice.nvim", enabled = false },
        -- Indent guide that "grows" to the scope. Way too slow.
        { "echasnovski/mini.indentscope", enabled = false },
        -- Shows notifications as "pop-ups". I don't like them.
        { "rcarriga/nvim-notify", enabled = false },
        -- I don't need to navigate TODOs.
        { "folke/todo-comments.nvim", enabled = false },
        -- Adds virtual text to search matches. Too noisy, not a fan.
        { "folke/flash.nvim", enabled = false },
        -- I prefer nvim-tree, it lets me do more.
        { "nvim-neo-tree/neo-tree.nvim", enabled = false },
        -- This is nice, but my muscle-memory is bound to tpope/vim-surround. This mimics it.
        {
            "echasnovski/mini.surround",
            opts = {
                custom_surroundings = {
                    ["("] = { output = { left = "( ", right = " )" } },
                    ["["] = { output = { left = "[ ", right = " ]" } },
                    ["{"] = { output = { left = "{ ", right = " }" } },
                    ["<"] = { output = { left = "< ", right = " >" } },
                },
                mappings = {
                    add = "ys",
                    delete = "ds",
                    find = "gs",
                    find_left = "gS",
                    highlight = "gh",
                    replace = "cs",
                    update_n_lines = "",
                },
                search_method = "cover_or_next",
            },
        },
        -- I hate auto-pairs, I prefer typing things on my own.
        { "echasnovski/mini.pairs", enabled = false },

	-- My stuff needs to be imported last.
        { import = "plugins" },
    },
})
