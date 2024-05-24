return {
    -- Lets "." repeat more kinds of things.
    "tpope/vim-repeat",

    -- Frees me from having to set up per-language indentation settings (just use whatever's already there)
    "tpope/vim-sleuth",

    -- Might try again if I can come up with an intuitive binding.
    { "folke/flash.nvim", enabled = false },

    {
        "hrsh7th/nvim-cmp",
        opts = {
            performance = {
                debounce = 500,
            },
        },
    },
    -- Pretty quickfix replacement.
    { "folke/trouble.nvim", opts = { use_diagnostic_signs = true } },

    -- Code coverage signs
    {
        "andythigpen/nvim-coverage",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("coverage").setup({ auto_reload = true }) end,
    },

    {
        "hrsh7th/nvim-cmp",
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local luasnip = require("luasnip")
            local cmp = require("cmp")

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<CR>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            cmp.confirm({ select = true })
                        end
                    else
                        fallback()
                    end
                end),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })
        end,
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
}
