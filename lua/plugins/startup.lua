return {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

    config = function()
        local utils = require("utils")

        local M = {}


        require "startup".setup({
            header = {
                type = "text",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Header",
                margin = 5,
                content = {
                    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
                    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
                    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
                    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
                    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
                    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
                },
                highlight = "Statement",
                default_color = "",
                oldfiles_amount = 0,
            },
            section_1 = {
                type = "mapping",
                content = {
                    { " New Project", "lua require('utils').new_project()", "<leader>np" },
                    { " Open Project", "Telescope workspaces", "<leader>op" },
                    { " Find File", "Telescope find_files", "<leader>ff" },
                    { " New File", "lua require'startup'.new_file()", "<leader>nf" },
                    { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
                },
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                margin = 1,
                highlight = "String",
                default_color = "",
                oldfiles_amount = 0
            },
            plugins = {
                type = "text",
                content = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    -- local clock = " " .. os.date("%H:%M")
                    -- local date = " " .. os.date("%d-%m-%y")
                    return {"⚡ Neovim loaded " .. stats.count .. " plugins"}
                end,
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "",
                margin = 5,
                highlight = "TSString",
                default_color = "#FFFFFF",
                oldfiles_amount = 10,
            },
            parts = { "header", "section_1", "plugins" }
        })

        return M
    end
}
