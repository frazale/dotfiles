vim.pack.add({
    { src = GH('saghen/blink.pairs') },
})

local pairs = require('blink.pairs')
pairs.build():pwait(10000)

pairs.setup({})
