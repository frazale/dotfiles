vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "blink.cmp" and (kind == "install" or kind == "update") then
      vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.path })
    end
  end,
})
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/folke/lazydev.nvim" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/saghen/blink.lib", },
  { src = "https://github.com/saghen/blink.download" },
  { src = "https://github.com/saghen/blink.pairs",          version = vim.version.range("*") },
  { src = "https://github.com/saghen/blink.compat",         version = vim.version.range("*") },
  { src = "https://github.com/saghen/blink.cmp",            version = vim.version.range("*") },
  -- setup conjure bs
  { src = "https://github.com/Olical/conjure" },
  { src = "https://github.com/PaterJason/cmp-conjure" },
})

require("lazydev").setup()
require("blink.compat").setup({})
-- blink
local blink = require("blink.cmp")
blink.setup({
  -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
  -- 'super-tab' for mappings similar to vscode (tab to accept)
  -- 'enter' for enter to accept
  -- 'none' for no mappings
  --
  -- All presets have the following mappings:
  -- C-space: Open menu or open docs if already open
  -- C-n/C-p or Up/Down: Select next/previous item
  -- C-e: Hide menu
  -- C-k: Toggle signature help (if signature.enabled = true)
  --
  -- See :h blink-cmp-config-keymap for defining your own keymap
  keymap = {
    preset = "enter",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
  },

  cmdline = {
    enabled = true,
    keymap = {
      preset = "inherit"
    },
    completion = {
      menu = {
        auto_show = true
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        }
      }
    }
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = "mono",
  },

  -- (Default) Only show the documentation popup when manually triggered
  completion = {
    documentation = { auto_show = true },
    accept = { auto_brackets = { enabled = true } },
    ghost_text = { enabled = true },
    list = {
      selection = {
        auto_insert = false,
        preselect = false,
      },
    },
  },

  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },

    per_filetype = {
      lua = {
        inherit_defaults = true,
        "lazydev",
      },
      lisp = {
        inherit_defaults = true,
        "conjure"
      }
    },

    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
      conjure = {
        name = "conjure",
        module = "blink.compat.source"
      }
    },
  },

  -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
  -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
  --
  -- See the fuzzy documentation for more information
  fuzzy = { implementation = "prefer_rust_with_warning" },
})

local pairs = require("blink.pairs")
pairs.setup({})
