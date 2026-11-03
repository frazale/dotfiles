vim.pack.add({
    { src = GH('folke/snacks.nvim') },
})

local s = require('snacks')

s.setup({
    picker = {},
    notifier = { enabled = true },
    terminal = { enabled = true },
})

MapTable('n', '<leader>s', {
    { '', '', 'Select' },
    { 'b', '', 'Buffer' },
    { 'd', function() s.picker.diagnostics() end, 'Diagnostics' },
    { 'bb', function() s.picker.buffers() end, 'Buffers' },
    { 'bl', function() s.picker.lines() end, 'Buffer lines' },
    {
        'bd',
        function() s.picker.diagnostics_buffer() end,
        'Buffer diagnostics',
    },
    { 'h', function() s.picker.help() end, 'Help pages' },
})

MapTable('n', '<leader>', {
    {
        'j',
        function() s.terminal('just', { auto_close = false }) end,
        'Just default',
    },
})

vim.keymap.set(
    't',
    { '<C-t>' },
    function() s.terminal.toggle() end,
    { desc = 'Terminal' }
)

vim.keymap.set(
    'n',
    { '<leader>t', '<C-t>' },
    function() s.terminal.toggle() end,
    { desc = 'Terminal' }
)
