vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.statusline").setup()
require("mini.tabline").setup()
require("mini.comment").setup()
require("mini.jump").setup({
  delay = {
    highlight = 0,
  }
})
