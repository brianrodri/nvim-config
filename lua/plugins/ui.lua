return {
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nord").setup({
                diff = { mode = "fg" },
                search = { theme = "vscode" },
            })
            vim.cmd.colorscheme("nord")
        end,
        install = {
            colorscheme = { "nord" },
        },
    },

    -- I'd rather have the extra lines.
    { "nvim-treesitter/nvim-treesitter-context", enabled = false },

    -- I prefer instant feedback over animations.
    { "echasnovski/mini.indentscope", enabled = false },

    { import = "lazyvim.plugins.extras.ui.mini-starter", keys = false },

    -- Default telescope bindings are nice, but they're taking too many bindings. I'll set 'em myself.
    { "nvim-telescope/telescope.nvim", keys = false },

    -- Sleep statusline replacement
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

    {
        -- Pretty quickfix replacement.
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },
}
