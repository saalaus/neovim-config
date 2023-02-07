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
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end
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
