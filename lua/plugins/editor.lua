return {
    "tpope/vim-unimpaired",

    "tpope/vim-repeat",

    {
        "NMAC427/guess-indent.nvim",
        config = function()
            require("guess-indent").setup({})
        end,
    },

    -- Code coverage integration
    {
        "andythigpen/nvim-coverage",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("coverage").setup()
        end,
    },
}
