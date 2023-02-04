return {
    {
        "Pocco81/auto-save.nvim",
        config = true,
        event = "BufReadPost",
        enabled = false
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        config = function()

            require("indent_blankline").setup {
                show_current_context = true,
                show_current_context_start = true,
            }
        end
    },
    {
        "jiangmiao/auto-pairs",
    },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = true,
        event = "BufReadPre"
    },
    {
        "j-hui/fidget.nvim",
        config = true,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end
    },
    {
        "RRethy/vim-illuminate",
        event = "BufReadPost"
    },
    {
        'famiu/bufdelete.nvim',
        event = "BufReadPost",
        cmd = "Bdelete"
    }
}
