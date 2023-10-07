return {
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.test.core" },
    {
        "nvim-neotest/neotest",
        dependencies = { "marilari88/neotest-vitest", "nvim-tree/nvim-web-devicons" },
        opts = function(_, opts)
            vim.list_extend(opts.adapters, { "neotest-vitest" })
        end,
    },
}
