local dap = require("dap")
local dap_ui_widgets = require("dap.ui.widgets")
local dapui = require("dapui")

return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<leader>d", name = "+debug" },

            { "<leader>d<CR>", dap.continue, desc = "Continue" },
            { "<leader>ds", dap.pause, desc = "Pause" },
            { "<leader>dx", dap.terminate, desc = "Terminate" },

            -- Motion-based intuition for navigating through stack traces:
            -- | h | left  | Run Last  | move back to the previous stacktrace
            -- | j | down  | Step Into | move down the current stack trace
            -- | k | up    | Step Out  | move up the current stack trace
            -- | l | right | Step Over | move on to the next stack trace
            { "<leader>dh", dap.run_last, desc = "Step Back" },
            { "<leader>dj", dap.step_into, desc = "Step Into" },
            { "<leader>dk", dap.step_out, desc = "Step Out" },
            { "<leader>dl", dap.step_over, desc = "Step Over" },

            { "<leader>dg", dap.run_to_cursor, desc = "Run to cursor" },
            { "<leader>dG", dap.goto_, desc = "Go to Line (without executing it)" },

            { "<leader>db", dap.toggle_breakpoint, desc = "Toggle Breakpoint" },
            {
                "<leader>dB",
                function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
                desc = "Breakpoint Condition",
            },

            { "<leader>dd", dap.run_last, desc = "Re-run session" },

            { "<leader>dr", dap.repl.toggle, desc = "Toggle REPL" },
            { "<leader>dD", dap.session, desc = "Session" },

            { "<leader>dw", dap_ui_widgets.hover, desc = "Widgets" },
        },
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function(_, opts) dapui.setup(opts) end,
        keys = {
            { "<leader>de", dapui.eval, desc = "Eval", mode = { "n", "v" } },
            { "<leader>du", dapui.toggle, desc = "Dap UI" },
        },
    },
}
