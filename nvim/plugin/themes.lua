vim.pack.add({
  { src = "https://github.com/sainnhe/sonokai" },
  { src = "https://github.com/ember-theme/nvim" },
  { src = "https://github.com/norcalli/nvim-base16.lua" },
  { src = "https://github.com/RRethy/base16-nvim" },
})

require("base16-colorscheme").with_config({
  telescope = true,
  indentblankline = true,
  notify = true,
  ts_rainbow = true,
  cmp = true,
  illuminate = true,
  dapui = true,
})

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end
