return {
    {
        "folke/snacks.nvim",
        dependencies = { "MaximilianLloyd/ascii.nvim" },
        opts = function()
            local header = vim.iter(require("ascii").get_random("anime", "onepiece")):join("\n")

            vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { link = "Green", force = true })

            vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { link = "Comment", force = true })
            vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { link = "Comment", force = true })
            vim.api.nvim_set_hl(0, "SnacksDashboardKey", { link = "Green", force = true })

            vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { link = "Comment", force = true })
            vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { link = "Green", force = true })

            return { dashboard = { preset = { header = header } } }
        end,
    },
}
