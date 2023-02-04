local opt = vim.opt
local g = vim.g
local sign = vim.fn.sign_define

opt.number         = false
opt.relativenumber = true
opt.mouse          = 'a'
opt.wrap           = false
opt.showmode       = false
-- amount spaces for tabs
opt.tabstop        = 4
-- << >> tabs sizes
opt.shiftwidth     = 4
-- tabs to spaces
opt.expandtab      = true
opt.scrolloff      = 7
opt.clipboard      = "unnamedplus"
opt.swapfile       = false
opt.backup         = false
opt.termguicolors  = true
opt.completeopt    = { 'menu', 'menuone', 'noselect' }
opt.title          = true
opt.titlestring    = "%t"
opt.cmdheight      = 1
opt.cursorline     = true

-- disable netrw at the very start of your init.lua (strongly advised)
g.loaded_netrw       = 1
g.loaded_netrwPlugin = 1

g.vsnip_snippet_dir  = ".vsnip"


vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = false,
    virtual_lines = false
})


-- Debug Icons
sign('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint' })
sign('DapBreakpointCondition',
    { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
sign('DapBreakpointRejected',
    { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
sign('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
sign('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
