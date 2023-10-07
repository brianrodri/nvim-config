-- Required to disable LazyVim's default settings -_-
package.loaded["lazyvim.config.options"] = true

-- Needs to be set before running lazy.nvim.
vim.g.mapleader = " "

-- bootstrap lazy.nvim, LazyVim and plugins
require("config.lazy")
