return {
    'junnplus/lsp-setup.nvim',
    -- dir = '~/Documents/workspace/nvim-lsp-setup',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'folke/neodev.nvim'
    },
    init = function()
        local rounded = { border = 'rounded' }
        vim.diagnostic.config({ float = rounded })
        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, rounded)
        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, rounded)
    end,
    opts = {
        mappings = {
            gd = function() require('telescope.builtin').lsp_definitions() end,
            gi = function() require('telescope.builtin').lsp_implementations() end,
            gr = function() require('telescope.builtin').lsp_references() end,
            ['<space>f'] = vim.lsp.buf.format,
        },
        servers = {
            eslint = {},
            pylsp = {
                settings = {
                    pylsp = {
                        -- PylspInstall python-lsp-black
                        -- PylspInstall pyls-isort
                        configurationSources = { 'flake8' },
                        plugins = {
                            pycodestyle = {
                                enabled = false,
                            },
                            mccabe = {
                                enabled = false,
                            },
                            pyflakes = {
                                enabled = false,
                            },
                            flake8 = {
                                enabled = true,
                            },
                            black = {
                                enabled = true,
                            }
                        }
                    }
                }
            },
            yamlls = {
                settings = {
                    yaml = {
                        keyOrdering = false
                    }
                }
            },
            zk = {},
            jsonls = {},
            bashls = {},
            tsserver = {},
            clojure_lsp = {},
            dockerls = {},
            jsonnet_ls = {},
            zls = {},
            gopls = {
                settings = {
                    gopls = {
                        gofumpt = true,
                        -- staticcheck = true,
                        usePlaceholders = true,
                        codelenses = {
                            gc_details = true,
                        },
                        hints = {
                            rangeVariableTypes = true,
                            parameterNames = true,
                            constantValues = true,
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            functionTypeParameters = true,
                        }
                    },
                },
            },
            -- clangd = {},
            solc = {},
            bufls = {},
            html = {},
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        }
                    }
                }
            },
            ['rust_analyzer@nightly'] = {
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            disabled = { 'unresolved-proc-macro' },
                        },
                        cargo = {
                            loadOutDirsFromCheck = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            }
        }
    },
}
