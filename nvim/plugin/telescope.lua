vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
      vim.system({ "make" }, { cwd = ev.data.path })
    end
  end,
})

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

local t = require("telescope")
t.setup({})
t.load_extension("fzf")

local set = function()
  local s = function(args)
    for _, mapping in pairs(args) do
      vim.keymap.set("n", mapping[1], mapping[2], { desc = mapping[3] })
    end
  end

  local builtin = require("telescope.builtin")
  s({
    { "<leader>f", function() end, "Find" },
    {
      "<leader>fcu",
      function()
        builtin.commands()
      end,
      "Telescope user commands",
    },
    {
      "<leader>fch",
      function()
        builtin.command_history()
      end,
      "Telescope cmd history",
    },
    {
      "<leader>fca",
      function()
        builtin.autocommands()
      end,
      "Telescope autocommands",
    },
    {
      "<leader>ft",
      function()
        builtin.colorscheme()
      end,
      "Telescope colors",
    },
  })
end
set()
