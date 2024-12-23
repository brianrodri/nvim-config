local workspaces = {
    {
        name = "Personal",
        path = "~/Documents/Vault",
        overrides = {
            daily_notes = { folder = "1 - Journal/Daily" },
            notes_subdir = "2 - Fleeting Notes",
            attachments = { img_folder = "8 - Meta/Attachments" },
        },
    },
}

return {
    {
        "epwalsh/obsidian.nvim",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        event = vim.iter(workspaces)
            :map(function(wksp) return vim.fn.expand(wksp.path) .. "/*.md" end)
            :map(function(path) return { "BufReadPre " .. path, "BufNewFile " .. path } end)
            :flatten()
            :totable(),
        opts = {
            completion = { nvim_cmp = false },
            disable_frontmatter = true,
            new_notes_location = "notes_subdir",
            picker = { name = "fzf-lua" },
            ui = { enable = false },
            use_advanced_uri = true,
            workspaces = workspaces,
        },
    },
}
