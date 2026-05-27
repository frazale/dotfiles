vim.g.mapleader = " "
vim.g.maplocalleader = vim.keycode(",")

vim.loader.enable(true)

vim.g.loaded_netrw = 1
vim.g.loaded_netrePlugin = 1
vim.opt.termguicolors = true

-- conjure stuff
vim.g["conjure#mapping#prefix"] = "<leader>m"
vim.g["conjure#filetypes"] = { "clojure", "elixir", "fennel", "hy", "julia", "racket", "scheme", "lisp" }
vim.g["conjure#eval#inline#highlight"] = "DiagnosticInfo"
vim.b["conjure#mapping#doc_word"] = false
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lisp",
  callback = function()
    vim.b["conjure#mapping#doc_word"] = { "K" }
  end,
})
-- conjure stuff end

require("keymaps")
require("autocmds")
require("options")
require("lsp")
