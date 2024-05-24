return {
    {
        "marilari88/neotest-vitest",
        dependencies = {
            {
                "nvim-neotest/neotest",
                opts = function(_, opts)
                    vim.tbl_deep_extend("force", opts.status, { signs = false, virtual_text = false })
                    vim.list_extend(opts.adapters, { "neotest-vitest" })
                end,
            },
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
        },
    },
}
