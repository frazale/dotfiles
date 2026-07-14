 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#fffcf0',
    base01 = '#f2f0e5',
    base02 = '#ebe8d7',
    base03 = '#9b9368',
    base04 = '#6f6e69',
    base05 = '#100f0f',
    base06 = '#100f0f',
    base07 = '#100f0f',
    base08 = '#d14d41',
    base09 = '#8b7ec8',
    base0A = '#4385be',
    base0B = '#879a39',
    base0C = '#2c1b7e',
    base0D = '#6b7e1b',
    base0E = '#1b507e',
    base0F = '#e8ccc9',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#100f0f',          bg = '#fffcf0' })
  hi('TelescopeBorder',         { fg = '#9b9368',             bg = '#fffcf0' })
  hi('TelescopePromptNormal',   { fg = '#100f0f',          bg = '#fffcf0' })
  hi('TelescopePromptBorder',   { fg = '#9b9368',             bg = '#fffcf0' })
  hi('TelescopePromptPrefix',   { fg = '#879a39',             bg = '#fffcf0' })
  hi('TelescopePromptCounter',  { fg = '#6f6e69',  bg = '#fffcf0' })
  hi('TelescopePromptTitle',    { fg = '#fffcf0',             bg = '#879a39' })
  hi('TelescopePreviewTitle',   { fg = '#fffcf0',             bg = '#4385be' })
  hi('TelescopeResultsTitle',   { fg = '#fffcf0',             bg = '#8b7ec8' })
  hi('TelescopeSelection',      { fg = '#100f0f',          bg = '#ebe8d7' })
  hi('TelescopeSelectionCaret', { fg = '#879a39',             bg = '#ebe8d7' })
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
