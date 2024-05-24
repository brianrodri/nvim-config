return {
    {
        -- Color scheme
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = { style = "night" },
    },

    {
        -- Cool file explorer
        "nvim-tree/nvim-tree.lua",
        init = function()
            -- Disable built-in netrw file explorer.
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        config = function() require("nvim-tree").setup({ renderer = { group_empty = true } }) end,
    },

    -- Sleek statusline replacement
    { "nvim-lualine/lualine.nvim", opts = { colorscheme = "tokyonight" }, event = "VeryLazy" },

    {
        -- Pretty quickfix replacement.
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },
}
