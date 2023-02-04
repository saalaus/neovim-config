return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "jay-babu/mason-null-ls.nvim" },
    event = "BufReadPre",
    config = function()
        require("mason-null-ls").setup({
            automatic_setup = true,
        })

        local PYLINT_IGNORE_RULES = {
            "unused-import",
            "missing-module-docstring",
            "missing-class-docstring",
            "missing-function-docstring",
        }

        local null_ls = require("null-ls")
        require 'mason-null-ls'.setup_handlers {
            function(source_name, methods)
                -- all sources with no handler get passed here

                -- To keep the original functionality of `automatic_setup = true`,
                -- please add the below.
                require("mason-null-ls.automatic_setup")(source_name, methods)
            end,

            pylint = function(source_name, methods)
                local sources = {
                    null_ls.builtins.diagnostics.pylint.with({
                        extra_args = {
                            "-d=" .. table.concat(PYLINT_IGNORE_RULES, ","),
                            '--init-hook="import pylint_venv; pylint_venv.inithook()"'
                        },
                        method = null_ls.methods.DIAGNOSTICS_ON_SAVE
                    })
                }
                null_ls.register(sources)
            end,

            mypy = function(source_name, methods)
                local sources = {
                    null_ls.builtins.diagnostics.mypy.with({
                        method = null_ls.methods.DIAGNOSTICS_ON_SAVE
                    })
                }
                null_ls.register(sources)
            end
        }

        null_ls.setup({
            diagnostics_format = "#{m} [#{c}]",
        })
    end
}
