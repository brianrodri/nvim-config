return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                gdscript = {
                    filetypes = { "gd", "gdscript", "gdscript3" },
                },
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "gdscript" } },
    },
    {
        "mfussenegger/nvim-dap",
        opts = function()
            local dap = require("dap")
            if not dap.adapters["godot"] then
                dap.adapters["godot"] = {
                    type = "server",
                    host = "127.0.0.1",
                    port = 6006,
                }
                dap.configurations.gdscript = {
                    {
                        type = "godot",
                        request = "launch",
                        name = "Launch scene",
                        project = "${workspaceFolder}",
                        launch_scene = true,
                    },
                }
            end
        end,
    },
}
