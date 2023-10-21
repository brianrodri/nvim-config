local work_jdtls_exists, _ = pcall(require, "work.jdtls")

return {
    { import = "lazyvim.plugins.extras.lang.java" },
    work_jdtls_exists and { import = "work.jdtls" } or nil,
}
