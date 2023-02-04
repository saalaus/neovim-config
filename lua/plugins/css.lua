return {
    "NvChad/nvim-colorizer.lua",
    config = function()
        require 'colorizer'.setup {
            filetypes = {
                "css",
                "javascript",
                "svelte"
            },
            user_default_options = {
                mode = "virtualtext"
            }
        }
    end
}
