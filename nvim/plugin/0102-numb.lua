vim.pack.add({
    { src = GH('nacro90/numb.nvim') },
})

local numb = require('numb')
numb.setup({
    centered_peeking = true,
    show_numbers = true,
    show_cursorline = true,
    hide_relativenumbers = true,
})
