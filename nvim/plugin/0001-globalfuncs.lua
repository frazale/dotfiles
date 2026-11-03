GH = function(repo) return 'https://github.com/' .. repo end

---@class KeymapTable
---@field [1] string Last key of Lhs, appended to lhs_partial
---@field [2] string|function command or function to be assigned to lhs
---@field [3] string description
local K

---@param modes string|string[]
---@param lhs_partial string keys that will be prepended to lhs of each mapping
---@param mappings {lhs:string, rhs:string|function, description:string}[]
MapTable = function(modes, lhs_partial, mappings)
    local lhs, rhs, desc = 1, 2, 3
    for _, v in pairs(mappings) do
        vim.keymap.set(modes, lhs_partial .. v[lhs], v[rhs], { desc = v[desc] })
    end
end

vim.api.nvim_create_user_command(
    'DiagnosticHover',
    function()
        vim.diagnostic.open_float({
            focus = false,
            focusable = true,
            scope = 'cursor',
        })
    end,
    { desc = 'Show diagnostic hover window' }
)

vim.keymap.set('n', '<C-k>', '<cmd>DiagnosticHover<cr>')
