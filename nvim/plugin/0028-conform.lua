vim.pack.add({
    { src = GH('stevearc/conform.nvim') },
})

require('conform').setup({
    formatters_by_ft = {
        lua = { 'stylua' },
        odin = { 'odinfmt' },
    },
    formatters = {
        odinfmt = {
            command = 'odinfmt',
            options = {
                tabs = false,
                tabs_width = 4,
            },
            args = { '-stdin' },
            stdin = true,
        },
    },
    default_format_opts = {
        lsp_format = 'fallback',
    },
    format_on_save = {
        timeout_ms = 500,
    },
})

vim.keymap.set('n', '<leader>f', function ()
  require('conform').format()
end, { desc = "Format" })
