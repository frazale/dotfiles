 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#100f0f',
    base01 = '#1c1b1a',
    base02 = '#272524',
    base03 = '#615f5c',
    base04 = '#878580',
    base05 = '#cecdc3',
    base06 = '#cecdc3',
    base07 = '#cecdc3',
    base08 = '#d14d41',
    base09 = '#8b7ec8',
    base0A = '#4385be',
    base0B = '#879a39',
    base0C = '#a496e9',
    base0D = '#d8e996',
    base0E = '#96c2e9',
    base0F = '#54120b',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#cecdc3',          bg = '#100f0f' })
  hi('TelescopeBorder',         { fg = '#615f5c',             bg = '#100f0f' })
  hi('TelescopePromptNormal',   { fg = '#cecdc3',          bg = '#100f0f' })
  hi('TelescopePromptBorder',   { fg = '#615f5c',             bg = '#100f0f' })
  hi('TelescopePromptPrefix',   { fg = '#879a39',             bg = '#100f0f' })
  hi('TelescopePromptCounter',  { fg = '#878580',  bg = '#100f0f' })
  hi('TelescopePromptTitle',    { fg = '#100f0f',             bg = '#879a39' })
  hi('TelescopePreviewTitle',   { fg = '#100f0f',             bg = '#4385be' })
  hi('TelescopeResultsTitle',   { fg = '#100f0f',             bg = '#8b7ec8' })
  hi('TelescopeSelection',      { fg = '#cecdc3',          bg = '#272524' })
  hi('TelescopeSelectionCaret', { fg = '#879a39',             bg = '#272524' })
  hi('TelescopeMatching',       { fg = '#879a39',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
