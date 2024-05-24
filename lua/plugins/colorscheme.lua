return {
    {
        "sainnhe/everforest",
        priority = 1000,
        lazy = false,
        config = function()
            vim.o.background = "dark"
            vim.o.termguicolors = true
            vim.g.everforest_background = "hard"
            vim.g.everforest_better_performance = 1
            vim.g.everforest_dim_inactive_windows = true
            vim.cmd.colorscheme("everforest")
        end,
    },

    { "nvim-lualine/lualine.nvim", opts = { theme = "everforest" } },
}
