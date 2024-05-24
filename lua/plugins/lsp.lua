local local_jdtls_exists, _ = pcall(require, "local.jdtls")

return {
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
    local_jdtls_exists and { import = "local.jdtls" } or nil,
}
