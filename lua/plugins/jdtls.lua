local work_jdtls = { import = "work.jdtls" }
local status, _ = pcall(require, "work.jdtls")
if not status then
    work_jdtls = nil
end

return {
    { import = "lazyvim.plugins.extras.lang.java" },
    work_jdtls,
}
