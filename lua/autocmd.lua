local cmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup

local YankHighlightGrp = group("YankHighlightGrp", {})
cmd("TextYankPost", {
    group = YankHighlightGrp,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 2000,
        })
    end,
})

local PythonGrp = group("Python cmd group", {})
-- Run python files with Ctrl+h
-- autocmd FileType python map <buffer> <C-h> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
-- autocmd FileType python imap <buffer> <C-h> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

-- rule for python 79 character
cmd("FileType", {
    group = PythonGrp,
    pattern = "python",
    callback = function()
        vim.opt_local.colorcolumn = "79"
    end
})

-- local FormattingGrp = group("Formatting group", {})
-- cmd({ "BufWritePre", "FileWritePre" }, {
--     group = FormattingGrp,
--     pattern = { "*" },
--     command = [[%s/\s\+$//e]],
-- })


local TextWrapGrp = group("Text wrap", {})
cmd('BufEnter', {
    pattern = { "*.md", "*.txt" },
    group = TextWrapGrp,
    command = "setlocal wrap"
})


local listener_ls = vim.api.nvim_create_namespace('key_listener')

-- Deleting hlsearch when it already no needed
local function toggle_hlsearch(char)
  local keys = { '<CR>', 'n', 'N', '*', '#', '?', '/' }
  local new_hlsearch = vim.tbl_contains(keys, char)

  if vim.opt.hlsearch:get() ~= new_hlsearch then
    vim.opt.hlsearch = new_hlsearch
  end
end

---Handler for pressing keys. Added listeners for modes
---@param char string
local function key_listener(char)
  local key = vim.fn.keytrans(char)
  local mode = vim.fn.mode()
  -- print('Mode: ', mode, 'Key: ', key)
  if mode == 'n' then
    toggle_hlsearch(key)
  end
end

vim.on_key(key_listener, listener_ls)

