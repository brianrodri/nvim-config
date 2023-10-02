return {
    {
        "aserowy/tmux.nvim",
        event = "BufReadPre",
        opts = { enable_default_keybindings = true },
        config = function()
            require("tmux").setup()
        end,
    },
}
