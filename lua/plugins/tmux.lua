return {
    -- Provies key bindings for seamlessly jumping between tmux/vim windows.
    -- This must also be installed as a TPM plugin: 'aserowy/tmux.nvim' (same repo functions as a tmux plugin)
    {
        "aserowy/tmux.nvim",
        event = "BufReadPre",
        opts = { enable_default_keybindings = true },
        config = function() require("tmux").setup() end,
    },
}
