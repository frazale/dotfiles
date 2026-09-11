vim.pack.add({
    { src = GH('lewis6991/gitsigns.nvim') },
    { src = GH('nvim-tree/nvim-web-devicons') },
    { src = GH('nvim-lualine/lualine.nvim') },
    { src = GH('romgrk/barbar.nvim') },
})

local lualine = require('lualine')
local barbar = require('barbar')

lualine.setup({
    options = {
        globalstatus = true,
    },
})

barbar.setup({
    animation = false,
    auto_hide = false,
    tabpages = true,
})
