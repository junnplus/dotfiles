local lsp_installer = require('nvim-lsp-installer')

local servers = {
    'eslint',
    'gopls',
    'pylsp',
    'jsonls',
    'bashls',
    'tsserver',
    'clangd',
    'sumneko_lua',
    'rust_analyzer',
}

for _, name in pairs(servers) do
    local found, server = lsp_installer.get_server(name)
    if found and not server:is_installed() then
        server:install()
    end
end
