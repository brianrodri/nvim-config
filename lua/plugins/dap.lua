return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<leader>td", function() require'jdtls'.test_nearest_method() end, "Debug Nearest" },
            { "<leader>tD", function() require'jdtls'.test_class() end, "Debug Class" },
            { "<leader>t/", function() require'jdtls'.pick_test() end, "Pick Debug Test" },

            { "<leader>bB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
            { "<leader>bb", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },

            { "<leader>bc", function() require("dap").run_to_cursor() end, desc = "Run to cursor" },

            { "<leader>bK", function() require("dap.ui.widgets").hover() end, desc = "Widget for cursor" },
            { "<leader>bG", function() require("dap").goto_() end, desc = "Go to Line (without executing it)" },

            { "<leader>bn", function() require("dap").continue() end, desc = "Continue" },
            { "<leader>bs", function() require("dap").pause() end, desc = "Pause" },
            { "<leader>bx", function() require("dap").terminate() end, desc = "Terminate" },

            -- Motion-based intuition for navigating through stack traces:
            -- | h | left  | Run Last  | move back to the previous stacktrace
            -- | j | down  | Step Into | move down the current stack trace
            -- | k | up    | Step Out  | move up the current stack trace
            -- | l | right | Step Over | move on to the next stack trace
            { "<leader>bh", function() require("dap").run_last() end, desc = "Run Last" },
            { "<leader>bj", function() require("dap").step_into() end, desc = "Step Into" },
            { "<leader>bk", function() require("dap").step_out() end, desc = "Step Out" },
            { "<leader>bl", function() require("dap").step_over() end, desc = "Step Over" },

            { "<leader>br", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
            { "<leader>bD", function() require("dap").session() end, desc = "Session" },
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        keys = {
            { "<leader>bu", function() require("dapui").toggle({ }) end, desc = "DAP UI" },
        },
    },
}
