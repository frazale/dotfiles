local set = vim.keymap.set
set("n", "L", "<cmd>bnext<cr>", { desc = "Next buffer" })
set("n", "H", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
set("n", "<Esc>", "<cmd>nohlsearch<cr>")
set("i", "<M-l>", "<Right>")
set("i", "<M-h>", "<Left>")
set("i", "<M-k>", "<Up>")
set("i", "<M-j>", "<Down>")

---@class setnl.Binding
---@field key string
---@field cmd string|function
---@field Opts vim.keymap.set.Opts
---@alias setnl.Bindings setnl.Binding[]

---@param opts setnl.Bindings
local function setnl(opts)
  local function _setnl(keym, cmd, Opts)
    vim.keymap.set("n", keym, cmd, Opts)
  end
  for _, args in pairs(opts) do
    _setnl(args.key, args.cmd, args.Opts)
  end
end

setnl({
  {
    key = "<leader>b",
    cmd = "",
    Opts = { desc = "Buffers" },
  },
  {
    key = "<leader>bq",
    cmd = "<cmd>bdelete<cr>",
    Opts = { desc = "Close buffer" },
  },
  {
    key = "cs",
    cmd = "<cmd>startreplace<cr>",
    Opts = { desc = "Replace character" },
  },
  {
    key = "<C-k>",
    cmd = "<cmd>wincmd k<cr>",
    Opts = { desc = "Window up" },
  },
  {
    key = "<C-j>",
    cmd = "<cmd>wincmd j<cr>",
    Opts = { desc = "Window down" },
  },
  {
    key = "<C-h>",
    cmd = "<cmd>wincmd h<cr>",
    Opts = { desc = "Window left" },
  },
  {
    key = "<C-l>",
    cmd = "<cmd>wincmd l<cr>",
    Opts = { desc = "Window right" },
  },
  {
    key = "<leader>wK",
    cmd = "<cmd>wincmd K<cr>",
    Opts = { desc = "Window move up" },
  },
  {
    key = "<leader>wJ",
    cmd = "<cmd>wincmd J<cr>",
    Opts = { desc = "Window move down" },
  },
  {
    key = "<leader>wH",
    cmd = "<cmd>wincmd H<cr>",
    Opts = { desc = "Window move left" },
  },
  {
    key = "<leader>wL",
    cmd = "<cmd>wincmd L<cr>",
    Opts = { desc = "Window move right" },
  },
  {
    key = "<C-Up>",
    cmd = "<cmd>vertical wincmd +<cr>",
    Opts = {},
  },
  {
    key = "<C-Down>",
    cmd = "<cmd>vertical wincmd -<cr>",
    Opts = {},
  },
  {
    key = "<C-Left>",
    cmd = "<cmd>horizontal wincmd <<cr>",
    Opts = {},
  },
  {
    key = "<C-Right>",
    cmd = "<cmd>horizontal wincmd ><cr>",
    Opts = {},
  },
  {
    key = "<leader>w",
    cmd = "",
    Opts = { desc = "Window" },
  },
  {
    key = "<leader>ws",
    cmd = "",
    Opts = { desc = "Split" },
  },
  {
    key = "<leader>wsh",
    cmd = "<cmd>split<cr>",
    Opts = { desc = "Split below" },
  },
  {
    key = "<leader>wsv",
    cmd = "<cmd>vsplit<cr>",
    Opts = { desc = "Vertical split" },
  },
  {
    key = "<leader>wq",
    cmd = "<cmd>close<cr>",
    Opts = { desc = "Close window" },
  },
  {
    key = "<leader>wQ",
    cmd = "<cmd>only<cr>",
    Opts = { desc = "Close other windows" },
  },
  {
    key = "<leader>wt",
    cmd = "<cmd>tabnew<cr>",
    Opts = { desc = "New tab" },
  },
  {
    key = "<leader>wk",
    cmd = "<cmd>wincmd k<cr>",
    Opts = { desc = "Window up" },
  },
  {
    key = "<leader>wj",
    cmd = "<cmd>wincmd j<cr>",
    Opts = { desc = "Window down" },
  },
  {
    key = "<leader>wl",
    cmd = "<cmd>wincmd l<cr>",
    Opts = { desc = "Window right" },
  },
  {
    key = "<leader>wh",
    cmd = "<cmd>wincmd h<cr>",
    Opts = { desc = "Window left" },
  },
})

set("n", "<A-r>", "r")
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
