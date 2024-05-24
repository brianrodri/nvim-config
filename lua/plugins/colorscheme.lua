return {
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = { style = "night" } },
    {
        "LazyVim/LazyVim",
        opts = function(_, opts)
            opts.colorscheme = "tokyonight"
        end,
    },
    { "nvim-lualine/lualine.nvim", colorscheme = "tokyonight" },
}
