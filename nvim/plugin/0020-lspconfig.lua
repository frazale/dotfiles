vim.pack.add({
    { src = GH('neovim/nvim-lspconfig') },
})

local lsp = {
    'lua_ls',
    'ols',
    'tombi',
    'nixd',
    'yamlls',
}

vim.lsp.enable(lsp)
