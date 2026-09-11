vim.pack.add({
    { src = GH('saghen/blink.cmp') }
})

local cmp = require('blink.cmp')
cmp.build():pwait(10000)

cmp.setup({
    keymap = {
        preset = 'super-tab',
    },
    completion = {
        trigger = {
            show_in_snippet = true,
        },
        menu = {
            enabled = true,
            auto_show = true,
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 100,
            treesitter_highlighting = true,
        },
        list = {
            selection = {
                preselect = true,
                auto_insert = true,
            },
        },
    },
    sources = {
        default = {
            'lazydev',
            'lsp',
            'path',
            'snippets',
            'buffer',
        },
        providers = {
            lazydev = {
                name = 'LazyDev',
                module = 'lazydev.integrations.blink',
                score_offset = 100,
            },
        },
    },

    signature = {
        enabled = true,
        trigger = {
            enabled = true,
        },
        window = {
            show_documentation = false,
        },
    },
    fuzzy = {
        implementation = 'rust',
    },
})
