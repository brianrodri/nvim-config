return {
    {
        "nvim-tree/nvim-tree.lua",
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        config = function()
            require("nvim-tree").setup({
                renderer = {
                    group_empty = true,
                },
            })
        end,
        keys = {
            { "<leader>T", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
        },
    },
}
