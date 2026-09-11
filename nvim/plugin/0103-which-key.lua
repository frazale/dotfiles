vim.pack.add({
    { src = GH('folke/which-key.nvim') },
})

local wk = require('which-key')
wk.setup({
    preset = 'helix',
    delay = 0,
    win = {
        border = 'single',
    },
})
