local local_jdtls_exists, _ = pcall(require, "local.jdtls")

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            -- Inlay hints take up too much real estate.
            inlay_hints = { enabled = false },
            servers = {
                bashls = {
                    filetypes = { "zsh" },
                },
            },
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = { "marilari88/neotest-vitest", "nvim-neotest/neotest-jest" },
        opts = {
            adapters = {
                ["neotest-vitest"] = {},
                ["neotest-jest"] = {},
            },
        },
    },
    local_jdtls_exists and { import = "local.jdtls" } or nil,
}
