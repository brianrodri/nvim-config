return {
    -- Lets "." repeat more kinds of things.
    "tpope/vim-repeat",

    -- Frees me from having to set up per-language indentation settings (just use whatever's already there)
    "tpope/vim-sleuth",

    -- Look up nerd font symbols from within neovim.
    {
        "2kabhishek/nerdy.nvim",
        dependencies = { "stevearc/dressing.nvim", "nvim-telescope/telescope.nvim" },
        config = function() require("telescope").load_extension("nerdy") end,
    },

    -- Beautiful quicklist replacement
    {
        "folke/trouble.nvim",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xl",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
        opts = {
            auto_close = true,
            auto_preview = false,
            restore = false,
        },
    },

    {
        -- This is nice, but my muscle-memory is bound to tpope/vim-surround. This mimics it.
        "echasnovski/mini.surround",
        opts = {
            custom_surroundings = {
                ["("] = { output = { left = "( ", right = " )" } },
                ["["] = { output = { left = "[ ", right = " ]" } },
                ["{"] = { output = { left = "{ ", right = " }" } },
                ["<"] = { output = { left = "< ", right = " >" } },
            },
            mappings = {
                add = "ys",
                delete = "ds",
                find = "gs",
                find_left = "gS",
                highlight = "gh",
                replace = "cs",
                update_n_lines = "",
            },
            search_method = "cover_or_next",
        },
    },

    {
        "echasnovski/mini.move",
        opts = {
            mappings = {
                -- Visual mode
                left = "",
                down = "]e",
                up = "[e",
                right = "",
                -- Normal mode
                line_left = "",
                line_down = "]e",
                line_up = "[e",
                line_right = "",
            },
        },
    },

    {
        "ahmedkhalf/project.nvim",
        opts = {
            manual_mode = false,
            patterns = { ".git", ".obsidian", "package.json", "project.godot" },
        },
    },

    {
        "klen/nvim-config-local",
        opts = {
            lookup_parents = true,
        },
    },
}
