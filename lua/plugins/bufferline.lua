return {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VimEnter",
    config = function()
        require('bufferline').setup({
            options = {
                mode = 'buffers',
                offsets = {
                    { filetype = 'NvimTree', text = 'File Explorer', text_align = "center" }
                },
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
            },
            highlights = {
                buffer_selected = {
                    italic = false
                },
                indicator_selected = {
                    fg = { attribute = 'fg', highlight = 'Function' },
                    italic = false
                }
            }
        })
    end
}
