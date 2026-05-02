vim.o.updatetime = 100
-- vim.api.nvim_create_autocmd({ "CursorHold" }, {
-- 	callback = function()
-- 		vim.diagnostic.open_float()
-- 	end,
-- })

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})
vim.api.nvim_create_user_command(
  "PackDel",
  function(args)
    vim.pack.del({ args.args }, { force = true })
  end,
  {
    nargs = 1,
    desc = "Delete vim.pack package"
  })

vim.api.nvim_create_user_command(
  "PackUpdate",
  function(args)
    if args.bang then
      vim.pack.update({ force = true })
    else
      vim.pack.update()
    end
  end,
  {
    nargs = 0,
  })
