local local_jdtls_exists, _ = pcall(require, "local.jdtls")

return {
    local_jdtls_exists and { import = "local.jdtls" } or nil,
}
