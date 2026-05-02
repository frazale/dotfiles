vim.pack.add({ "https://github.com/folke/flash.nvim" })

local flash = require("flash")
local setn = function(key, command, desc)
  vim.keymap.set({ "n", "x", "o" }, key, command, { desc = desc })
end

setn("s", function()
  flash.jump()
end, "Flash")

setn("S", function()
  flash.treesitter()
end, "Flash treesitter")

setn("r", function()
  flash.remote()
end, "Flash remote")

setn("R", function()
  flash.treesitter_search()
end, "Treesitter search")

setn("<C-s>", function()
  flash.toggle()
end, "Flash toggle")
