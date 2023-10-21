local function new_coverage_jumper(dir, type)
    local jump = require("coverage").jump_next
    if dir == "prev" then
        jump = require("coverage").jump_prev
    end
    return function()
        return jump(type)
    end
end

require("which-key").register({
    ZA = { ":qa!<CR>", "Force quit" },

    ["]b"] = { "<cmd>bnext<CR>", "Next buffer" },
    ["[b"] = { "<cmd>bprevious<CR>", "Previous buffer" },

    ["<leader>"] = {
        e = { ":e! %<CR>", "Force re-open" },

        gg = {
            function()
                require("lazy.util").float_term({ "lazygit" }, {
                    cwd = require("lazyvim.util").root.get(),
                    esc_esc = false,
                    ctrl_hjkl = false,
                })
            end,
            "Lazygit",
        },

        l = { "<cmd>Lazy<CR>", "LazyVim" },

        w = { ":w!<CR>", "Force write" },

        T = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },

        ["?"] = { name = "+coverage" },
        ["?cn"] = { new_coverage_jumper("next", "covered"), "Next covered" },
        ["?cp"] = { new_coverage_jumper("prev", "covered"), "Previous covered" },
        ["?un"] = { new_coverage_jumper("next", "uncovered"), "Next uncovered" },
        ["?up"] = { new_coverage_jumper("prev", "uncovered"), "Previous uncovered" },
        ["?pn"] = { new_coverage_jumper("next", "partial"), "Next partially covered" },
        ["?pp"] = { new_coverage_jumper("prev", "partial"), "Previous partially covered" },

        ["<C-f>"] = { ":LazyFormat<CR>", "LazyFormat" },

        ["<C-h>"] = { ":topleft vsplit<CR>", "Split left" },
        ["<C-j>"] = { ":belowright split<CR>", "Split down" },
        ["<C-k>"] = { ":topleft split<CR>", "Split up" },
        ["<C-l>"] = { ":belowright vsplit<CR>", "Split right" },
    },
})
