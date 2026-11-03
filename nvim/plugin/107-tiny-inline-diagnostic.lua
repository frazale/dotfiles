vim.pack.add({
    { src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim' },
})

require('tiny-inline-diagnostic').setup({
    preset = 'minimal',
    transparent_bg = true,
    transparent_cursorline = true,
    options = {
        show_source = {
            enabled = true,
            if_many = true,
        },
        show_code = true,
        set_arrow_to_diag_color = true,
        add_messages = {
            messages = true,
        },
        multilines = {
            enabled = true,
            trim_whitespace = true,
            tabstop = 2,
        },
        show_diags_only_under_cursor = true,
        override_open_float = true,
        experimental = {
            use_window_local_extmarks = true,
        },
    },
})
vim.diagnostic.config({ virtual_text = false })
