local set = vim.keymap.set

local dap_keys = {
    { 'n', '<cmd>DapNew<cr>', 'New DAP session' },
    { 'D', '<cmd>DapContinue<cr>', 'Continue' },
    { 'T', '<cmd>DapTerminate<cr>', 'Terminate' },
    { 'R', '<cmd>DapRestartFrame<cr>', 'Restart frame' },
    { 'i', '<cmd>DapStepInto<cr>', 'Step into' },
    { 'o', '<cmd>DapStepOver<cr>', 'Step over' },
    { 'O', '<cmd>DapStepOut<cr>', 'Step out' },
    { 'p', '<cmd>DapPause<cr>', 'Pause' },
    { 'e', '<cmd>DapEval<cr>', 'Eval' },
    { 'r', '<cmd>DapToggleRepl<cr>', 'Toggle Repl' },
    { 'X', '<cmd>DapClearBreakpoints<cr>', 'Clear all breakpoints' },
    { 'd', '<cmd>DapToggleBreakpoint<cr>', 'Toggle breakpoint' },
    { 'l', '<cmd>DapShowLog<cr>', 'Show log' },
    { 'L', '<cmd>DapSetLogLevel<cr>', 'Set log level' },
}

local window_keys = {
    { 'q', '<cmd>close<cr>', 'Window close' },
    { 'd', '<cmd>bdelete<cr>', 'Buffer delete' },
    { 'D', '<cmd>bdelete!<cr>', 'Buffer force delete' },
    { 'h', '<cmd>wincmd h<cr>', 'Window left' },
    { 'j', '<cmd>wincmd j<cr>', 'Window down' },
    { 'k', '<cmd>wincmd k<cr>', 'Window up' },
    { 'l', '<cmd>wincmd l<cr>', 'Window right' },
    { 'H', '<cmd>wincmd H<cr>', 'Window move left' },
    { 'J', '<cmd>wincmd J<cr>', 'Window move down' },
    { 'K', '<cmd>wincmd K<cr>', 'Window move up' },
    { 'L', '<cmd>wincmd L<cr>', 'Window move right' },
    { 'r', '<cmd>wincmd r<cr>', 'Window rotate' },
    { 'R', '<cmd>wincmd <C-r><cr>', 'Window reverse rotate' },
    { 'T', '<cmd>wincmd T<cr>', 'Window to new tab' },
    { 't', '<cmd>tabnew<cr>', 'Tab new' },
    { '<tab>', '<cmd>tabNext<cr>', 'Tab next' },
    { '<S-tab>', '<cmd>tabprevious<cr>', 'Tab previous' },
    { 's', '<cmd>split<cr>', 'Split horizontal' },
    { 'S', '<cmd>vsplit<cr>', 'Split vertical' },
}

local float = function() vim.diagnostic.open_float() end
local normal_keys = {
    { '<S-h>', '<cmd>bprevious<cr>' },
    { '<S-l>', '<cmd>bnext<cr>' },
    { '<C-k>', float },
}

for _, v in pairs(normal_keys) do
    set({ 'n', 'v' }, v[1], v[2])
end

set({ 'n', 'v' }, '<leader>w', '', { desc = 'Window' })
for _, v in pairs(window_keys) do
    local lhs = '<leader>w' .. v[1]
    set({ 'n', 'v' }, lhs, v[2], { desc = v[3] })
end

set({ 'n', 'v' }, '<leader>d', '', { desc = 'Debug (DAP)' })
for _, v in pairs(dap_keys) do
    local lhs = '<leader>d' .. v[1]
    set({ 'n', 'v' }, lhs, v[2], { desc = v[3] })
end

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')
vim.keymap.set(
    'n',
    '<leader>H',
    function()
        vim.lsp.inlay_hint.enable(
            not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
        )
    end,
    { desc = 'Toggle inlay hint' }
)
