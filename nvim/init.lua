vim.loader.enable(false)

vim.g.loaded_netrw = 1
vim.g.loaded_netrePlugin = 1
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = "m"

require("keymaps")
require("autocmds")
require("options")
require("lsp")
