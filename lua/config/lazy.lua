local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local work_plugins_exists, _ = pcall(require, "work.plugins")

require("lazy").setup({
    spec = {
        {
            -- Brings in a lot of cool plugins, but I don't want all of them...
            "LazyVim/LazyVim",
            import = "lazyvim.plugins",
            opts = { defaults = { keymaps = false } },
        },

        -- Animated indentation guides, but I prefer instant feedback over animations.
        { "echasnovski/mini.indentscope", enabled = false },

        -- Bugs out often and stays persistent at top of screen.
        { "nvim-treesitter/nvim-treesitter-context", enabled = false},

        {
            -- This is nice, but my muscle-memory is bound to tpope/vim-surround. This mimics it.
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

        {
            -- Default telescope bindings are nice, but they're taking too many bindings. I'll set 'em myself.
            "nvim-telescope/telescope.nvim",
            keys = false,
        },

        -- My stuff needs to be imported last.
        { import = "plugins" },
        work_plugins_exists and { import = "work.plugins" } or nil,
    },
})
