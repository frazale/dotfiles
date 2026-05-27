vim.pack.add({
  { src = "https://github.com/sainnhe/sonokai" },
  { src = "https://github.com/ember-theme/nvim" }
})

vim.api.nvim_create_autocmd({ "FileType", "BufReadPre", "BufEnter" }, {
  pattern = "*",
  callback = function(opts)
    local ft = vim.bo[opts.buf].filetype
    if ft == "lisp" then
      vim.cmd("highlight Comment cterm=italic ctermfg=246 gui=italic guifg=#7accd7")
    else
      vim.cmd("highlight Comment cterm=italic ctermfg=246 gui=italic guifg=#848089")
    end
  end
})

vim.g.sonokai_style = 'shusia'
vim.cmd.colorscheme("sonokai")
