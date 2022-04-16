local api = vim.api

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

    buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)

    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    if client.resolved_capabilities.document_formatting then
        vim.cmd([[
          augroup Format
            au! * <buffer>
            au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
          augroup END
        ]])
    end
end

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

lsp_installer.on_server_ready(function(server)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
    local config = {
        capabilities = capabilities,
        on_attach = on_attach,
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
        -- Avoiding LSP formatting conflicts.
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
        config.on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
            on_attach(client, bufnr)
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
    server:setup(config)
end)

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua.with({
            extra_args = { '--config-path', vim.fn.expand('~/.config/stylua/stylua.toml') },
        }),
    },
    on_attach = on_attach,
})

require('lsp_signature').setup({})
