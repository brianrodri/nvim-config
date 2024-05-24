vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.backspace = "indent,eol,start"
vim.opt.cursorline = true

vim.opt.grepprg = "rg --vimgrep"

vim.opt.mouse = "a"

vim.opt.relativenumber = true

vim.opt.shiftwidth = 4

vim.opt.signcolumn = "yes"

vim.opt.smartindent = true

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldtext = "v:lua.require'lazyvim.util.ui'.foldtext()"

vim.g.markdown_recommended_style = 0
