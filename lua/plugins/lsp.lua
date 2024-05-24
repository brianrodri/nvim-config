local which_key = require("which-key")

local local_jdtls_exists, _ = pcall(require, "local.jdtls")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        if vim.lsp.get_client_by_id(args.data.client_id) then
            which_key.register({
                K = { vim.lsp.buf.hover, "Hover" },
                gd = { vim.lsp.buf.definition, "Go to definition" },
                gi = { vim.lsp.buf.implementation, "Go to implementation" },
                gr = { vim.lsp.buf.references, "Go to references" },
                gK = { vim.lsp.buf.type_definition, "Go to type definition" },
                ["<C-k>"] = { vim.lsp.buf.signature_help, "Signature help", mode = "i" },
                ["<leader>rn"] = { vim.lsp.buf.rename, "Rename" },
            }, { buffer = args.buf, mode = "n" })

            which_key.register({
                ["<leader>ca"] = {
                    function() vim.lsp.buf.code_action({ apply = true }) end,
                    "Code action(s)",
                },
                ["<leader>cA"] = {
                    function() vim.lsp.buf.code_action({ apply = true, only = { "source" } }) end,
                    "Source action(s)",
                },
            }, { buffer = args.buf, mode = { "n", "v" } })
        end
    end,
})

return {
    local_jdtls_exists and { import = "local.jdtls" } or nil,
}
