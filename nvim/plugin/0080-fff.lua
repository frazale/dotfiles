vim.pack.add({
    { src = GH('dmtrKovalenko/fff') },
})

-- require('fff.download').download_or_build_binary()

local fff = require('fff')
fff.setup({})

MapTable('n', '<leader>s', {
    { 'f', function() fff.find_files() end, 'Find files' },
    {
        's',
        function() fff.live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end,
        'Live grep',
    },
    {
        'S',
        function() fff.live_grep_under_cursor() end,
        'Search current word / selection',
    },
})
