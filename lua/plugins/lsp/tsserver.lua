return {
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.test.core" },

    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            vim.tbl_deep_extend("force", opts.servers, {
                ["tsserver.keys"] = {
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
            })
        end,
    },
}
