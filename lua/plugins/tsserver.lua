return {
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.test.core" },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                tsserver = {
                    keys = {
                        {
                            "<leader><C-y>",
                            function()
                                vim.lsp.buf.code_action({
                                    apply = true,
                                    context = {
                                        only = { "source.organizeImports.ts" },
                                        diagnostics = {},
                                    },
                                })
                            end,
                            desc = "Organize Imports",
                        },
                    },
                },
            },
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = { "marilari88/neotest-vitest", "nvim-tree/nvim-web-devicons" },
        opts = function(_, opts)
            vim.list_extend(opts.adapters, { "neotest-vitest" })
        end,
    },
}
