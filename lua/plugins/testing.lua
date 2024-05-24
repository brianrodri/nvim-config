return {
    {
        "nvim-neotest/neotest",
        opts = function(_, opts) vim.list_extend(opts.adapters, { "neotest-vitest", "neotest-java" }) end,
        dependencies = {
            "rcasia/neotest-java",
            "marilari88/neotest-vitest",
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
        },
    },
}
