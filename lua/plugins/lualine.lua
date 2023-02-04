return {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
        local utils = require("utils")


        local function lsp_client_names(component)
            local client_names = {}
            local icon = component.icon or ' '

            for _, client in ipairs(vim.lsp.get_active_clients()) do
                table.insert(client_names, icon .. client.name)
            end
            return table.concat(client_names, " ")
        end

        local function python_version(component)
            if vim.bo.filetype ~= "python" then
                return ''
            end
            local icon = component.icon or ''

            local version = utils.get_popen("python -V")
            local venv = utils.get_popen("python -c \"import sys;print(sys.executable.split('/')[-3])\"")
            if string.match(venv, "env") ~= nil then
                version = version .. "(" .. venv .. ")"
            end
            return icon .. version
        end

        require('lualine').setup({
            options = {
                globalstatus = true,
                theme = 'gruvbox-material',
                icons_enabled = true,
            },
            sections = {
                lualine_a = { { "diagnostics", colored = false }, "mode" },
                lualine_b = { "branch", "filename" },
                -- lualine_c = { { python_version }, lsp_client_names },
                lualine_c = {},
                lualine_x = { "encoding", "fileformat" },
                lualine_y = { "filetype" },
                lualine_z = { "location" }
            }
        })
    end
}
