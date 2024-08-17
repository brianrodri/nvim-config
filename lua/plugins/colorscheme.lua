return {
    {
        "sainnhe/everforest",
        priority = 1000,
        lazy = false,
        config = function()
            vim.o.termguicolors = true
            vim.o.background = "dark"
            vim.g.everforest_background = "hard"
            vim.g.everforest_ui_contrast = "high"
            vim.g.everforest_enable_italic = 1
            vim.g.everforest_better_performance = 1
            vim.cmd.colorscheme("everforest")
        end,
    },

    { "nvim-lualine/lualine.nvim", opts = { theme = "everforest" } },
}
