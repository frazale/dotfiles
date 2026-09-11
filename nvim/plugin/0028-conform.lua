vim.pack.add({
    { src = GH('stevearc/conform.nvim') },
})

require('conform').setup({
    formatters_by_ft = {
        lua = { 'stylua' },
    },
    default_format_opts = {
        lsp_format = 'fallback',
    },
    format_on_save = {
        timeout_ms = 500,
    },
})
