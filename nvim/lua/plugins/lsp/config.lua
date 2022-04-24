local utils = require('nvim-lsp-setup.utils')

local mappings = {
    gd = 'Telescope lsp_definitions',
    gi = 'Telescope lsp_implementations',
    gr = 'Telescope lsp_references',
}

local settings = {
    mappings = mappings,
    servers = {
        eslint = {},
        pylsp = {},
        jsonls = {},
        bashls = {},
        tsserver = {},
        clangd = {},
        gopls = {
            settings = {
                golsp = {
                    gofumpt = true,
                    staticcheck = true,
                    useplaceholders = true,
                    codelenses = {
                        gc_details = true,
                    },
                },
            },
        },
        sumneko_lua = vim.tbl_deep_extend('force', {
            on_attach = function(client, bufnr)
                utils.mappings(bufnr, mappings)
                utils.disable_formatting(client)
            end,
        }, require('lua-dev').setup()),
        rust_analyzer = {
            settings = {
                ['rust-analyzer'] = {
                    cargo = {
                        loadOutDirsFromCheck = true,
                    },
                    procMacro = {
                        enable = true,
                    },
                    -- checkOnSave = {
                    --     command = 'clippy',
                    -- },
                },
            },
        },
    },
}

require('nvim-lsp-setup').setup(settings)

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua.with({
            extra_args = { '--config-path', vim.fn.expand('~/.config/stylua/stylua.toml') },
        }),
    },
    on_attach = function(client)
        utils.format_on_save(client)
    end,
})

require('lsp_signature').setup({})
