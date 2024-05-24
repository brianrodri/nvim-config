local local_jdtls_exists, _ = pcall(require, "local.jdtls")

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            -- Useful for debugging formatter issues
            format_notify = true,
            servers = {
                bashls = {
                    filetypes = { "zsh" },
                },
            },
        },
    },
    local_jdtls_exists and { import = "local.jdtls" } or nil,
}
