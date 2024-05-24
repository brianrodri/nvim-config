return {

    -- I'd rather have the extra lines.
    { "nvim-treesitter/nvim-treesitter-context", enabled = false },

    -- I prefer instant feedback over animations.
    { "echasnovski/mini.indentscope", enabled = false },

    { import = "lazyvim.plugins.extras.ui.mini-starter", keys = false },

    -- Default telescope bindings are nice, but they're taking too many bindings. I'll set 'em myself.
    { "nvim-telescope/telescope.nvim", keys = false },

    {
        -- Pretty quickfix replacement.
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },
}
