vim.pack.add({
  {
    src = "https://github.com/folke/snacks.nvim",
  },
})

---@type snacks.Config
local o = {
  input = {
    enabled = true
  },
  bigfile = {
    enabled = true,
  },
  notifier = {
    enabled = true,
  },
  scope = {
    enabled = true,
  },
  scroll = {
    enabled = true,
  },
  statuscolumn = {
    enabled = true,
  },
  terminal = {
    enabled = true,
  },
  words = { enabled = true },
  styles = {},
  win = {},
}

require("snacks").setup(o)
Snacks.keymap.set({ "n", "v", "t" }, "<leader>s", "", { desc = "Snacks" })

local function map(opts)
  for _, line in pairs(opts) do
    Snacks.keymap.set({ "n", "v" }, line[1], line[2], { desc = line[3] })
  end
end

map({
  { "<leader>sn", Snacks.notifier.show_history,                    "Notifier history" },
  { "<leader>sr", Snacks.rename.rename_file,                       "Rename file" },
  { "<leader>t",  Snacks.terminal.toggle,                          "Toggle terminal" },
  { "]]",         function() Snacks.words.jump(vim.v.count1) end,  "Next reference" },
  { "[[",         function() Snacks.words.jump(-vim.v.count1) end, "Previous reference" },
  { "<leader>d",  "",                                              "Toggles" },
})

Snacks.toggle.diagnostics():map("<leader>dd")
Snacks.toggle.treesitter():map("<leader>dt")
