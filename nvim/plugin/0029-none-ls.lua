vim.pack.add({
    { src = GH('nvimtools/none-ls.nvim') },
})

local none = require('null-ls')
none.setup({})
