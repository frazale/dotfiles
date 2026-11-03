vim.pack.add({
    { src = GH('nvim-treesitter/nvim-treesitter') },
})

local ns = vim.api.nvim_create_namespace('treesitter.start')
vim.api.nvim_set_decoration_provider(ns, {
    on_start = vim.schedule_wrap(function()
        for _, buf in pairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) then
                pcall(vim.treesitter.start, buf)
            end
        end
    end),
})

-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = { '*' },
--     callback = function() pcall(vim.treesitter.start) end,
-- })
