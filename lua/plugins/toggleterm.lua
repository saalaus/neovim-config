return {
    "akinsho/toggleterm.nvim",
    config = function()
        require('toggleterm').setup({
            open_mapping = '<C-g>',
            direction = 'tab',
            shade_terminals = true
        })
    end
}
