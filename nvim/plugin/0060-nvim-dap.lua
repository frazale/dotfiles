vim.pack.add({
    { src = GH('mfussenegger/nvim-dap') },
    { src = GH('nvim-neotest/nvim-nio') },
    { src = GH('rcarriga/nvim-dap-ui') },
})

local dui = require('dapui')
dui.setup()

MapTable('n', '<leader>d', {
    { 'u', function() dui.toggle() end, 'Toggle dap ui' },
})

local dap = require('dap')
dap.configurations.lua = {
    {
        type = 'nlua',
        request = 'attach',
        name = 'Attach to running nvim instance',
    },
}

dap.adapters.nlua = function(callback, config)
    callback({
        type = 'server',
        host = config.host or '127.0.0.1',
        port = config.port or 8086,
    })
end

dap.adapters.codelldb = {
    type = 'executable',
    command = 'codelldb',
}

dap.configurations.odin = {
    {
        name = 'Launch Odin Debug',
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input(
                'Path to executable: ',
                vim.fn.getcwd() .. '/',
                'file'
            )
        end,
    },
}
