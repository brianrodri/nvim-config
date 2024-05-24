-- Autoformat files that bother me
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "lua", "html", "xml", "css", "json", "txt" },
    callback = function() vim.b.autoformat = true end,
})
