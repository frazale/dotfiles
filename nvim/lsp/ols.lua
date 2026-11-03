---@type vim.lsp.Config
return {
    cmd = { 'ols' },
    filetypes = { 'odin' },
    settings = {},
    init_options = {
        enable_format = false,
        enable_inlay_hints_params = true,
        enable_inlay_hints_implicit_return = true,
        enable_inlay_hints_optional_return = true,
        checker_args = '-strict-style',
    },
}
