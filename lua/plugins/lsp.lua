local which_key = require("which-key")

local local_jdtls_exists, _ = pcall(require, "local.jdtls")

group = vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.completionProvider then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end
        if client.server_capabilities.definitionProvider then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        end
        if client.server_capabilities.documentRangeFormattingProvider then
            vim.bo[bufnr].formatexpr = 'v:lua.vim.lsp.formatexpr(#{timeout_ms:250})'
        end
        which_key.register({
            K = { vim.lsp.buf.hover, "Hover" },
            gd = { vim.lsp.buf.definition, "Go to definition" },
            gi = { vim.lsp.buf.implementation, "Go to implementation" },
            gr = { vim.lsp.buf.references, "Go to references" },
            gK = { vim.lsp.buf.type_definition, "Go to type definition" },
            ["<C-k>"] = { vim.lsp.buf.signature_help, "Signature help", mode = "i" },
            ["<leader>rn"] = { vim.lsp.buf.rename, "Rename" },
            ["<leader>ca"] = { function() vim.lsp.buf.code_action({ apply = true }) end, "Code action(s)", mode = { "n", "v" } },
        }, { buffer = bufnr })
    end,
})

return {
    local_jdtls_exists and { import = "local.jdtls" } or nil,
}
