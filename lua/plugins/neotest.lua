return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = function(_, opts)
            return vim.tbl_deep_extend("force", opts, {
                status = {
                    signs = false,
                    virtual_text = true,
                },
            })
        end,
    },
}
