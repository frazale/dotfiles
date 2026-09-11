vim.pack.add({
    { src = GH('folke/flash.nvim') },
})

local flash = require('flash')

MapTable({ 'n', 'x', 'o' }, '', {
    { 's', function() flash.jump() end, 'Flash' },
    {
        'S',
        function() flash.treesitter_search() end,
        'Flash TS search',
    },
})
