return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "jayp0521/mason-nvim-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        require("mason-nvim-dap").setup({
            automatic_setup = true
        })

        require("nvim-dap-virtual-text").setup {}
        require("dapui").setup()

        local dap = require("dap")
        require 'mason-nvim-dap'.setup_handlers {
            function(source_name)
                -- all sources with no handler get passed here


                -- Keep original functionality of `automatic_setup = true`
                require('mason-nvim-dap.automatic_setup')(source_name)
            end,
        }
    end
}
