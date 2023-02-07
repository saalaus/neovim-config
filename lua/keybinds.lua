vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
local opts = {noremap = false, silent = false}

map("i", "jj", "<Esc>", opts)
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
--map('', '<up>', '', opts)
--map('', '<down>', '', opts)
--map('', '<left>', '', opts)
--map('', '<right>', '', opts)
-- map('v', 'S-Y', '"*y', opts)
map('n', "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
map('n', "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
map('n', "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
map('n', "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
map('n', "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
map('n', "<C-o>", "o<Esc>", opts)
map("n", "<C-L>", "<cmd>bnext<cr>", opts)
map("n", "<C-H>", "<cmd>bprevious<cr>", opts)
-- map('n', "q:", "<nop>", opts)
-- map('n', "Q", "<nop>", opts)

map("n", "<leader>d", '"_d', opts)
map("x", "<leader>d", '"_d', opts)

map("n", "<C-c>", "<cmd>Bdelete<cr>", opts)
map("n", "<leader>op", "<cmd>Telescope workspaces<cr>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<C-s>", "<cmd>write<cr>", opts)

map("n", "<leader>d", "<cmd>lua require('notify').dismiss()<cr>", opts)
