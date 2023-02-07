return {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
        "stevearc/dressing.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- better code action UI
        "weilbith/nvim-code-action-menu",
        "ray-x/lsp_signature.nvim",
    },

    config = function()
        local utils = require("utils")
        vim.g.code_action_menu_show_details = false

        local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
        if not mason_status_ok then
            vim.notify("Couldn't load Mason-LSP-Config" .. mason_lspconfig, "error")
            return
        end
        mason_lspconfig.setup()

        local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
        if not lspconfig_status_ok then vim.notify("Couldn't load LSP-Config" .. lspconfig, "error")
            return
        end


        local opts = { noremap = true, silent = true }

        vim.keymap.set('n', '<space>k', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<space>q', "<cmd>Telescope diagnostics<cr>", opts)

        local lsp_opts = {
            on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<space>ca', "<CMD>CodeActionMenu<CR>", bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)


                if client.name == "pyright" then
                    vim.keymap.set('n', '<Leader>o', '<CMD>PyrightOrganizeImports<CR>')
                    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                        utils.custom_on_publish_diagnostics, {})

                end
            end,
            capabilities = require('cmp_nvim_lsp').default_capabilities()
        }


        local PYLINT_IGNORE_RULES = {
            "unused-import",
            "missing-module-docstring",
            "missing-class-docstring",
            "missing-function-docstring",
        }


        mason_lspconfig.setup_handlers({
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup({
                    on_attach = lsp_opts.on_attach,
                    capabilities = lsp_opts.capabilities,
                })
            end,

            ["sumneko_lua"] = function()
                lspconfig.sumneko_lua.setup({
                    on_attach = lsp_opts.on_attach,
                    capabilities = lsp_opts.capabilities,

                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            }
                        }
                    }
                }
                )
            end,
            ["pyright"] = function()
                lspconfig.pyright.setup({
                    on_attach = lsp_opts.on_attach,
                    capabilities = lsp_opts.capabilities,

                    settings = {
                        python = {
                            analysis = {
                                typeCheckingMode = "basic",
                            }
                        }
                    }
                })
            end,
            ["pylsp"] = function()
                lspconfig.pylsp.setup({
                    on_attach = lsp_opts.on_attach,
                    capabilities = lsp_opts.capabilities,

                    settings = {
                        pylsp = {
                            plugins = {
                                flake8 = { enabled = false },
                                pycodestyle = { enabled = false },
                                mccade = { enabled = false },
                                pyflakes = { enabled = false },
                                yapf = { enabled = false },
                                rope_autoimport = { enabled = true },
                                pylint = {
                                    enabled = true,
                                    args = { "-d=" .. table.concat(PYLINT_IGNORE_RULES, ",") }
                                },
                                autopep8 = { enabled = true }
                            }
                        }
                    }
                })
            end
        })

        require "lsp_signature".setup({
            bind = true,
            floating_window = false,
            toggle_key = "<C-p>",
            close_timeout = 500,
            hint_prefix = " "
        })

    end
}
