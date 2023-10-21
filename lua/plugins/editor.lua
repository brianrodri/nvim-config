return {
    -- Convenient back/forth mappings.
    "tpope/vim-unimpaired",

    -- Lets "." repeat more kinds of things.
    "tpope/vim-repeat",

    -- Frees me from having to set up per-language indentation settings (just use whatever's already there)
    "tpope/vim-sleuth",

    {
        -- Code coverage signs
        "andythigpen/nvim-coverage",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("coverage").setup() end,
    },
}
