local lazy = require("lazy")
local lazyvim_util = require("lazyvim.util")
local lazyvim_util_extras = require("lazyvim.util.extras")
local mini_starter = require("mini.starter")
local persistence = require("persistence")

local function centering_text(opts)
    local header = vim.split(opts.header or "", "\n")
    local footer = vim.split(opts.footer or "", "\n")
    local items = vim.iter(opts.items):map(function(item) return { item.section, item.name } end):flatten():totable()

    local header_len, footer_len, items_len = unpack(
        vim.iter({ header, footer, items })
            :map(function(arr) return vim.iter(arr):map(vim.fn.strwidth):fold(0, math.max) end)
            :totable()
    )
    local max_len = math.max(header_len, footer_len, items_len)
    local header_pad, footer_pad, items_pad = unpack(
        vim.iter({ header_len, footer_len, items_len })
            :map(function(len) return string.rep(" ", (max_len - len) / 2) end)
            :totable()
    )

    return vim.tbl_extend("keep", {
        header = vim.iter(header):map(function(line) return header_pad .. line end):join("\n"),
        footer = vim.iter(footer):map(function(line) return footer_pad .. line end):join("\n"),
        items = vim.iter(opts.items)
            :map(function(item) return vim.tbl_extend("keep", { section = items_pad .. item.section }, item) end)
            :totable(),
        content_hooks = {
            mini_starter.gen_hook.adding_bullet(items_pad, false),
            mini_starter.gen_hook.aligning("center", "center"),
        },
    }, opts)
end

return {
    {
        "echasnovski/mini.starter",
        opts = {
            evaluate_single = true,
            header = vim.iter({
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣴⣶⣶⣾⣿⣿⣿⣿⣿⣶⣶⣦⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠉⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀",
                "⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⢀⠀⢀⣼⣿⣿⠟⠛⠁⠀⠐⠋⠁⢾⣿⣿⣿⡿⢿⣿⣿⣿⣿⣷⡀⠀⠀⠀",
                "⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⣼⣿⣿⣿⣿⣏⠁⠀⠀⠀⠀⠀⠀⠀⠊⠉⠁⡀⠀⠀⠹⠿⣿⣿⣿⣿⡄⠀⠀",
                "⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠈⣿⣿⣿⣿⡷⠖⠀⠀⠀⠀⠀⠀⢚⣷⣿⣿⡿⠀⠀⠀⠀⢈⣿⣿⣿⣿⡄⠀",
                "⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⠈⠛⠿⠿⠦⠄⠀⠀⠀⠀⠀⠚⠈⠉⠉⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣷⠀",
                "⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⠄⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠻⣶⣾⣿⣿⣿⣿⣿⣿⣿⡆",
                "⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠛⠁⠀⠉⠻⣿⣿⠁⣼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡤⠀⠀⠀⢘⣿⣿⣿⣿⣿⣿⣿⣿⣧",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⣤⣼⣷⡆⠀⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢀⣾⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⣿⡿⠿⠃⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⢿⣿⣿⣿⣿⣿⣿⠿⣿⣿⡟⠀⢸⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣧⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿",
                "⢸⣿⣿⣿⣿⣿⡁⠀⠈⠛⠇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⢠⠀⠀⠰⠖⠃⠀⣠⣤⣤⣀⣀⡈⠻⣿⣿⣿⣿⣿⣿⣿⡇",
                "⠀⢿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⢸⡆⣀⣠⣤⠀⢾⠟⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⡿⠀",
                "⠀⠘⣿⣿⣿⣿⣿⣿⣿⣆⢠⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⢻⣿⣿⠇⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀",
                "⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⠀⠀⠀⠀⠚⠛⣡⣾⣿⣆⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀",
                "⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⣀⣀⣠⣼⣿⣿⣿⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠻⠿⠿⣿⣿⣿⣿⣿⣿⠿⠿⠟⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            }):join("\n"),
            -- stylua: ignore
            items = {
                { name = "f Find files",      action = lazyvim_util.telescope.telescope("find_files"), section = "" },
                { name = "r Recent files",    action = lazyvim_util.telescope.telescope("oldfiles"),   section = "" },
                { name = "c Config",          action = lazyvim_util.telescope.config_files(),          section = "" },
                { name = "l Lazyvim",         action = lazy.show,                                      section = "" },
                { name = "e Lazyvim Extras",  action = lazyvim_util_extras.show,                       section = "" },
                { name = "g Lazygit",         action = lazyvim_util.lazygit.open,                      section = "" },
                { name = "s Session restore", action = persistence.load,                               section = "" },
                { name = "q Quit",            action = vim.cmd.quitall,                                section = "" },
            },
        },
        config = function(_, opts)
            mini_starter.setup(centering_text(opts))

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = lazy.stats()
                    local footer = string.format(" %i plugins loaded in %.2fms", stats.count, stats.startuptime)
                    mini_starter.config = centering_text(vim.tbl_extend("keep", { footer = footer }, opts))
                    mini_starter.refresh()
                end,
            })
        end,
    },
}
