vim.g.mapleader = " "
vim.g.maplocalleader = vim.keycode(",")

vim.loader.enable(true)

vim.g.loaded_netrw = 1
vim.g.loaded_netrePlugin = 1
vim.opt.termguicolors = true

require("keymaps")
require("autocmds")
require("options")
require("lsp")

-- local ok, matugen = pcall(require, 'matugen')
-- if ok then matugen.setup() end
