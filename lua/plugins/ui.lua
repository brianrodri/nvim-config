return {
    -- Cool dashboard
    { import = "lazyvim.plugins.extras.ui.mini-starter", keys = false },

    -- I'd rather have the extra lines.
    { "nvim-treesitter/nvim-treesitter-context", enabled = false },

    -- I prefer instant feedback over animations.
    { "echasnovski/mini.indentscope", enabled = false },

    -- Default telescope bindings are nice, but they're taking too many bindings. I'll set 'em myself.
    { "nvim-telescope/telescope.nvim", keys = false },
}
