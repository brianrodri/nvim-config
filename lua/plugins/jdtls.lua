return {
    { import = "lazyvim.plugins.extras.lang.java" },
    {
        "mfussenegger/nvim-jdtls",
        opts = function(_, opts)
            local status, work_jdtls = pcall(require, "work.jdtls")
            if status and work_jdtls then
                local new_opts = work_jdtls.get_opts()
                if new_opts then
                    new_opts.cmd = vim.list_extend(opts.cmd, new_opts.cmd)
                    return vim.tbl_deep_extend("force", opts, new_opts)
                end
            end
        end,
    },
}
