return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim",
        'natecraddock/workspaces.nvim',
    },
    config = function()
        require("workspaces").setup({
            hooks = {
                open = { "NvimTreeOpen" },
                open_pre = { "%bd" } -- close all buffers
            }
        })
        require('telescope').setup {
            defaults = {}
        }
        require('telescope').load_extension('workspaces')
    end
}
