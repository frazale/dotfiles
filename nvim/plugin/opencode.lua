vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" },
  {
    src = "https://github.com/nickjvandyke/opencode.nvim",
    version = vim.version.range("*"),
  },
})

---@type opencode.Opts
vim.g.opencode_opts = {}

vim.o.autoread = true

local s = require("snacks")
local oc = require("opencode")

Snacks.keymap.set({ "n", "x" }, "<leader>o", "", { desc = "Opencode" })
Snacks.keymap.set({ "n", "x" }, "<leader>oa", function() oc.ask("@this: ") end, { desc = "Ask" })
Snacks.keymap.set({ "n", "x" }, "<leader>os", function() oc.select() end, { desc = "Select" })
Snacks.keymap.set(
  { "x" },
  "<leader>oo",
  function()
    return oc.operator("@this ")
  end,
  { desc = "Append range", expr = true }
)
Snacks.keymap.set(
  { "n" },
  "<leader>oo",
  function()
    return oc.operator("@this ") .. "_"
  end,
  { desc = "Append line", expr = true }
)
Snacks.keymap.set("n",
  "<A-p>",
  function()
    oc.command("session.half.page.up")
  end,
  { desc = "Scroll Opencode up" }
)
Snacks.keymap.set("n",
  "<A-n>",
  function()
    oc.command("session.half.page.down")
  end,
  { desc = "Scroll Opencode down" }
)
