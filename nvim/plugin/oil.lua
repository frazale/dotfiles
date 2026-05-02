vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
local oil = require("oil")
oil.setup({
  view_options = {
    show_hidden = true,
    case_insensitive = false,
  }
}
)

local set = function(lhs, rhs, description)
  vim.keymap.set("n", lhs, rhs, { desc = description })
end

set(
  "<leader>e",
  function()
    oil.toggle_float(nil, {
      -- preview = {
      --   vertical = true
      -- }
    })
  end,
  "Floating oil(files) toggle"
)
