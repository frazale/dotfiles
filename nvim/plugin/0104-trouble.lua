vim.pack.add({
    { src = GH('folke/trouble.nvim') },
})

local trouble = require('trouble')
trouble.setup({
    auto_close = true,
    pinned = false,
})

MapTable('n', '<leader>x', {
    { '', '', 'Trouble' },
    { 'x', '<cmd>Trouble diagnostics togle<cr>', 'Diagnostics' },
    { 's', '<cmd>Trouble symbols toggle focus=false<cr>', 'Symbols' },
    {
        'l',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        'LSP Definitions',
    },
    { 'L', '<cmd>Trouble loclist toggle<cr>', 'Location list' },
    { 'Q', '<cmd>Trouble qflist toggle<cr>', 'Quickfix list' },
})
