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
            vim.api.nvim_set_hl(0, "MiniStarterHeader", { fg = "#7fab5e" })
            vim.api.nvim_set_hl(0, "MiniStarterSection", { link = "Comment" })
            vim.api.nvim_set_hl(0, "MiniStarterItemPrefix", { fg = "#7fab5e", bold = true })
            vim.api.nvim_set_hl(0, "MiniStarterFooter", { link = "Grey" })
        end,
    },

    { "nvim-lualine/lualine.nvim", opts = { theme = "everforest" } },
}
