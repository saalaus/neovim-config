return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    dependencies = {
        -- navigate code
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    config = function()
        require 'nvim-treesitter.configs'.setup {
            auto_install = true,
            highlight = {
                enable = true
            },
            textobjects = {
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>sa"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>sA"] = "@parameter.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["<C-p>"] = "@parameter.inner",
                    },
                    goto_previous_start = {
                        ["<S-P>"] = "@parameter.inner",
                    },
                },
            },
        }
    end
}
