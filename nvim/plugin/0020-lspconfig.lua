vim.pack.add({
    { src = GH('neovim/nvim-lspconfig') },
})

local lsp = {
    'lua_ls',
    'ols',
    'tombi',
    'yamlls',
    'clangd',
    'tinymist',
    'jsonls',
    'neocmake',
    'shuck',
    'panache',
    'basedpyright',
    'ruff',
    'nim_langserver',
}

vim.lsp.config('clangd', {
    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
    },

    cmd = {
        'clangd',
        '--all-scopes-completion',
        '--background-index',
        '--clang-tidy',
        '--completion-style=detailed',
        '--experimental-modules-support',
        '--fallback-style=llvm',
        '--header-insertion=iwyu',
    },
})

vim.lsp.config('nim_langserver', {
    settings = {
        nim = {
            inlayHints = {
                typeHints = true,
                exceptionHints = true,
                parameterHints = true,
            },
            formatOnSave = true,
            autoRestart = true,
        },
    },
})

vim.lsp.enable(lsp)
