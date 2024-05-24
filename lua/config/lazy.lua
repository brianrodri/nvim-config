--- bootstrap lazy.nvim
local lazy_install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazy_install_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazy_install_path,
    })
end
vim.opt.runtimepath:prepend(vim.env.LAZY or lazy_install_path)
--- end

local local_plugins_exist, _ = pcall(require, "local.plugins")

require("lazy").setup({
    spec = {
        {
            "LazyVim/LazyVim",
            import = "lazyvim.plugins",
            opts = {
                -- I'd rather add them incrementally.
                defaults = { keymaps = false },
            },
        },
        { import = "plugins" },
        local_plugins_exist and { import = "local.plugins" } or nil,
    },
})
