return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    keys = {
        {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Nvimtree"}
    },
    cmd = {"NvimTreeToggle", "NvimTreeOpen"},

    config = function()

        local api = require("nvim-tree.api")

        require("nvim-tree").setup({
            diagnostics = {
                enable = true
            },
            view = {
                adaptive_size = true
            },
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true
            },
            on_attach = function(bufnr)
                -- create python package(folder+__init__.py) on leader+p
                vim.keymap.set("n", "<leader>p", function()
                    local node = api.tree.get_node_under_cursor().absolute_path
                    vim.ui.input("Python package name: ", function(item)
                        if not item then
                            return
                        end
                        local path_dir = node .. "/" .. item
                        vim.loop.fs_mkdir(path_dir, 493)
                        vim.loop.fs_open(path_dir .. "/" .. "__init__.py", "w", "420")
                        vim.notify("Package " .. item .. " was created")
                    end)
                end, { buffer = bufnr, noremap = true, silent = true })
            end
        })
    end
}
