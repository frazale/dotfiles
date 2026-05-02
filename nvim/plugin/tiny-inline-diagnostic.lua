vim.pack.add({
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
})

local opts = {
  preset = "minimal",
  options = {
    multilines = {
      enabled = true,
      trim_whitespaces = true,
    },
  },
  show_diags_only_under_cursor = true,
}

require("tiny-inline-diagnostic").setup(opts)
vim.diagnostic.config({ virtual_text = false })
