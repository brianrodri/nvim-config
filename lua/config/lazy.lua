local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local local_plugins_exist, _ = pcall(require, "local.plugins")

require("lazy").setup({
    spec = {
        {
            "LazyVim/LazyVim",
            import = "lazyvim.plugins",
            -- I'd rather add them incrementally.
            opts = { defaults = { keymaps = false } },
        },
        { import = "plugins" },
        local_plugins_exist and { import = "local.plugins" } or nil,
    },
})
