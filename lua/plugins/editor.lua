return {
    "tpope/vim-unimpaired",
    "tpope/vim-repeat",
    {
        "NMAC427/guess-indent.nvim",
        config = function()
            require("guess-indent").setup({})
        end,
    },
}
