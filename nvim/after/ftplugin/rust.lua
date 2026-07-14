local bufnr = vim.api.nvim_get_current_buf()

local function setLocalKey(opts)
  for _, line in pairs(opts) do
    vim.keymap.set("n", "<localleader>" .. line[1], line[2],
      { silent = true, buf = bufnr, desc = line[3] })
  end
end

setLocalKey({
  { "a", vim.cmd.RustLsp('codeAction'), "Code Action" }
})

vim.keymap.set(
  "n",
  "K",
  function()
    vim.cmd.RustLsp({ 'hover', 'actions' })
  end,
  { silent = true, buf = bufnr }
)
