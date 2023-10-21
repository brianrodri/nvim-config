return {
    {
        "marilari88/neotest-vitest",

        dependencies = {
            {
                "nvim-neotest/neotest",
                opts = function(_, opts) vim.list_extend(opts.adapters, { "neotest-vitest" }) end,
            },

            "nvim-lua/plenary.nvim",
        },
    },
}
