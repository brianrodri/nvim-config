return {
    {
        "sainnhe/everforest",
        priority = 1000,
        lazy = false,
        config = function()
            vim.o.background = "dark"
            vim.g.everforest_background = "hard"
            vim.cmd.colorscheme("everforest")
        end,
    },

    { "nvim-lualine/lualine.nvim", opts = { theme = "everforest" } },
}
