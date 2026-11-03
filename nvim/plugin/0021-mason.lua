vim.pack.add({
    { src = GH('mason-org/mason.nvim') },
    { src = GH('mason-org/mason-lspconfig.nvim') },
})

require('mason').setup()
require('mason-lspconfig').setup()
