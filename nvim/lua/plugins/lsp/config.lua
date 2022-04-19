local utils = require('plugins.lsp.utils')

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

utils.lsp_installer(servers).on_server_ready(function(server)
    local config = {
        capabilities = utils.capabilities(),
        on_attach = function(client, bufnr)
            utils.mappings(bufnr)
            utils.format_on_save(client, bufnr)
        end,
        flags = {
            debounce_text_changes = 150,
        },
    }

    if server.name == 'sumneko_lua' then
        local luadev = require('lua-dev').setup({
            lspconfig = {
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        },
                    },
                },
            },
        })
        config.on_attach = function(client, bufnr)
            utils.mappings(bufnr)
            utils.disable_formatting(client)
        end
        config = vim.tbl_deep_extend('force', config, luadev)
    end

    if server.name == 'gopls' then
        config.settings = {
            golsp = {
                gofumpt = true,
                staticcheck = true,
                useplaceholders = true,
                codelenses = {
                    gc_details = true,
                },
            },
        }
    end

    if server.name == 'rust-analyzer' then
        config.settings = {
            ['rust-analyzer'] = {
                checkOnSave = {
                    command = "clippy"
                }
            }
        }
    end
    server:setup(config)
end)

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua.with({
            extra_args = { '--config-path', vim.fn.expand('~/.config/stylua/stylua.toml') },
        }),
    },
    on_attach = function(client, bufnr)
        utils.mappings(bufnr)
        utils.format_on_save(client)
    end,
})

require('lsp_signature').setup({})
