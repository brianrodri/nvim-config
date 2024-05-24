return {
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nord").setup({ diff = { mode = "fg" }, search = { theme = "vscode" } })
            vim.cmd.colorscheme("nord")
        end,
        install = {
            colorscheme = { "nord" },
        },
    },

    { "nvim-lualine/lualine.nvim", opts = { theme = "nord" } },

    {
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup({
                options = { separator_style = "thin" },
                highlights = require("nord.plugins.bufferline").akinsho(),
            })
        end,
    },
}
