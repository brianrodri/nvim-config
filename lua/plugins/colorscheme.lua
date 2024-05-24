return {
    {
        "sainnhe/everforest",
        priority = 1000,
        lazy = false,
        config = function()
            vim.o.background = "dark"
            vim.o.termguicolors = true
            vim.g.everforest_better_performance = 1
            vim.cmd.colorscheme("everforest")
        end,
    },

    { "nvim-lualine/lualine.nvim", opts = { theme = "everforest" } },
}
