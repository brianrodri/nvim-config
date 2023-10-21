return {
    -- Convenient back/forth mappings.
    "tpope/vim-unimpaired",

    -- Lets "." repeat more kinds of things.
    "tpope/vim-repeat",

    -- Frees me from having to set up per-language indentation settings (just use whatever's already there)
    "tpope/vim-sleuth",

    -- A Git wrapper so awesome, it should be illegal
    "tpope/vim-fugitive",

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "davidsierradz/cmp-conventionalcommits",
            ft = { "gitcommit" },
            config = function()
                require("cmp").setup.buffer({
                    sources = require("cmp").config.sources(
                        { { name = "conventionalcommits" } },
                        { { name = "buffer" } }
                    ),
                })
            end,
        },
    },

    {
        -- Code coverage signs
        "andythigpen/nvim-coverage",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("coverage").setup() end,
    },
}
