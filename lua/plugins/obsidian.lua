local workspaces = {
    {
        name = "Personal",
        path = "~/Vault",
    },
}

return {
    {
        "epwalsh/obsidian.nvim",
        lazy = true,
        event = vim.iter(workspaces)
            :map(function(wksp) return vim.fn.expand(wksp.path) end)
            :map(function(path) return { "BufReadPre " .. path .. "/**.md", "BufNewFile " .. path .. "/**.md" } end)
            :flatten()
            :totable(),
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            disable_frontmatter = true,
            workspaces = workspaces,
            daily_notes = { folder = "Journal/Daily Logs" },
        },
    },
}
