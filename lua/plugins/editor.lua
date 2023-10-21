return {
    -- Convenient back/forth mappings.
    "tpope/vim-unimpaired",

    -- Lets "." repeat more kinds of things.
    "tpope/vim-repeat",

    {
        -- Frees me from setting up per-language indentation settings (just use whatever's already there)
        "NMAC427/guess-indent.nvim",
        config = function() require("guess-indent").setup({}) end,
    },

    {
        -- Code coverage signs
        "andythigpen/nvim-coverage",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("coverage").setup() end,
    },
}
