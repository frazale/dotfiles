vim.pack.add({
    { src = GH('mfussenegger/nvim-dap') },
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
