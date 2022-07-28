local settings = {
    mappings = {
        gd = 'lua require"telescope.builtin".lsp_definitions()',
        gi = 'lua require"telescope.builtin".lsp_implementations()',
        gr = 'lua require"telescope.builtin".lsp_references()',
    },
    servers = {
        eslint = {},
        pylsp = {},
        zk = {},
        jsonls = {},
        bashls = {},
        tsserver = {},
        clojure_lsp = {},
        clangd = require('nvim-lsp-setup.clangd_extensions').setup(),
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
        zls = {},
        sumneko_lua = require('lua-dev').setup({
            lspconfig = {
                settings = {
                    Lua = {
                        format = {
                            enable = true,
                            -- defaultConfig = {
                            --     indent_style = "space",
                            --     indent_size = "4",
                            -- },
                        }
                    }

                }
            }
        }),
        ["rust_analyzer@nightly"] = require('nvim-lsp-setup.rust-tools').setup({
            server = {
                settings = {
                    ['rust-analyzer'] = {
                        cargo = {
                            loadOutDirsFromCheck = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            },
        }),
    },
}

require('nvim-lsp-setup').setup(settings)
require('lsp_lines').setup()
vim.diagnostic.config({
    virtual_text = false,
})

require('lsp_signature').setup()
require('lsp-colors').setup()

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
