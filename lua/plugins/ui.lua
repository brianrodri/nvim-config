return {
    {
        -- Color scheme
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.termguicolors = true
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_diagnostic_line_highlight = 1
            vim.g.gruvbox_material_diagnostic_text_highlight = 1
            vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
            vim.g.gruvbox_material_enable_bold = 1
            vim.g.gruvbox_material_enable_italic = 1
            vim.g.gruvbox_material_foreground = "original"
            vim.g.gruvbox_material_statusline_style = "original"
            vim.g.gruvbox_material_ui_contrast = "high"
        end,
    },

    -- I prefer instant feedback over animations.
    { "echasnovski/mini.indentscope", enabled = false },

    { "LazyVim/LazyVim", opts = { colorscheme = "gruvbox-material" } },

    { import = "lazyvim.plugins.extras.ui.mini-starter", keys = false },

    -- Default telescope bindings are nice, but they're taking too many bindings. I'll set 'em myself.
    { "nvim-telescope/telescope.nvim", keys = false },

    -- Sleep statusline replacement
    { "nvim-lualine/lualine.nvim", opts = { theme = "gruvbox-material" } },

    {
        -- Pretty quickfix replacement.
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },
}
