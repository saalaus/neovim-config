## NeoVim config on Lua 
My neovim config written in Lua

![screenshot](https://i.imgur.com/COBM6ic.png)

# Instruction
Clone this repo on `~/.config/nvim` and run nvim

# Keybinds


### Main



| Mode | Key | Action |
| :---- | :------- | :-------- |
| - | `<leader>` | SPACE |
| i | `jj` | Exit in insert mode to normal |
| n | `SPACE+e` | Toggle file exploer |
| n | `Ctrl+o` | Insert new line |
| n | `Ctrl+h` | Back to the buffer |
| n | `Ctrl+l` | Next to the buffer |
| n | `SPACE+d` | Delete without yank |
| n | `Ctrl+c` | Exit buffer |
| n | `Ctrl+s` | Write file |
| n | `SPACE+d` | Dissmiss all notification |

### LSP
| Key | Action |
| :---- | :------- |
| `SPACE+e` | Open float window on problem |
| `[d` | Goto prev problem |
| `]d` | Goto next problem |
| `gd` | Goto definition |
| `Ctrl+P` | Show signature help |
| `SPACE+rn` | LSP Rename |
| `SPACE+f` | Format file |
| `SPACE+ca` | Code Action |
| `SPACE+o` | Organize import(Python Pyright) | 


### Completion
| Key | Action |
| :---- | :------- |
| Up(arrow) | Select prev item |
| Down(arrow) | Select next item |
| `Ctrl+b` | Scroll down docs |
| `Ctrl+f` | Scroll up docs |
| `Ctrl+SPACE` | Run completion |
| `Ctrl-e` | Hide completion |
| `Enter` | Select completion |
| `Tab` | Next item if completion visible, run completion if his hide |
| `Shift+Tab` | Select prev item |

### Debug
| Key | Action |
| :---- | :------- |
| `SPACE+B` | Toggle breakpoint current line |
| `F5` | Run(continue) debugger |
| `F6` | Step over |
| `F7` | Step into |
| `F8` | Step out |

### Telescope
| Key | Action |
| :---- | :------- |
| `SPACE+op` | Change project |
| `SPACE+ff` | Fuzzy finder project files |
| `SPACE+q` | Project diagnostics |

## Plugins

- `lazy.nvim` - package manager
    - `bufferline.nvim` - buffer manager
    - `nvim-cmp` - completion
        - `cmp-nvim-lsp`
        - `cmp-buffer`
        - `cmp-cmdline`
        - `cmp-path`
        - `vim-vsnip` - snippets
        - `cmp-vsnip`
        - `lspkind.nvim` - icons
        - `vim-vsnip-integ`
    - colorschemes
        - `gruvbox`
        - `gruvbox-material`
        - `vscode.nvim`
    - `nvim-comment` - better commenting
    - `nvim-colorizer.lua` - css colorizer
    - `nvim-dap` - debugger
        - `mason-nvim-dap.nvim` - debugger installer
        - `nvim-dap-virtual-text`
        - `nvim-dap-ui`
    - `nvim-lspconfig` - LSP
        - `mason-lspconfig.nvim` - LSP installer
        - `nvim-code-action-menu` - better code action
        - `lsp_signature.nvim`
    - `lualine.nvim` - bottom lualine
    - `mason.nvim` - LSP, DAP, Linter, Formatting manager
    - `null-ls.nvim` - code action, formatters, linters
        - `mason-null-ls.nvim` - installer
    - `nvim-tree.lua` - file tree exploer
        - `nvim-web-devicons` - icons
    - `auto-save.nvim`
    - `indent-blankline.nvim`
    - `auto-pairs`
    - `fidget.nvim`
    - `nvim-notify` - better notify
    - `vim-illuminate`
    - `bufdelete.nvim` - better buffers delete
    - `startup.nvim` - startup menu
    - `nvim-surround`
    - `telescope.nvim` - fuzzy finder
        - `workspaces.nvim` - projects managers
    - `toggleterm.nvim` - terminal
    - `nvim-treesitter`
        - `nvim-treesitter-textobjects`
