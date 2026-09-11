vim.pack.add({
    { src = GH('nvim-treesitter/nvim-treesitter') },
})

vim.cmd('TSUpdate')

local ts = require('nvim-treesitter')
local languages = {}
for _, l in pairs(languages) do
    ts.install(l)
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = { '<filetype>' },
    callback = function() vim.treesitter.start() end,
})
