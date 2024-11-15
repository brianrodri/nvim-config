return {
    {
        "sainnhe/everforest",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.g.everforest_background = "hard"
            vim.g.everforest_better_performance = 1
            vim.g.everforest_enable_italic = 1
            vim.g.everforest_float_style = "dim"
            vim.g.everforest_ui_contrast = "high"
            vim.cmd.colorscheme("everforest")
        end,
    },
}
