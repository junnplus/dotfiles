return {
    -- 'junnplus/lsp-setup.nvim',
    dir = '/Users/jun/Documents/workspace/nvim-lsp-setup',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'folke/neodev.nvim'
    },
    init = function()
        vim.lsp.set_log_level('debug')
        require('vim.lsp.log').set_format_func(vim.inspect)

        local rounded = { border = 'rounded' }
        vim.diagnostic.config({ float = rounded })
        local with_rounded = function(handler)
            return vim.lsp.with(handler, rounded)
        end
        vim.lsp.handlers['textDocument/hover'] = with_rounded(vim.lsp.handlers.hover)
        vim.lsp.handlers['textDocument/signatureHelp'] = with_rounded(vim.lsp.handlers.signature_help)

        for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
            local default_diagnostic_handler = vim.lsp.handlers[method]
            vim.lsp.handlers[method] = function(err, result, context, config)
                if err ~= nil and err.code == -32802 then
                    return
                end
                return default_diagnostic_handler(err, result, context, config)
            end
        end
    end,
    opts = {
        mappings = {
            gd = function() require('telescope.builtin').lsp_definitions() end,
            gi = function() require('telescope.builtin').lsp_implementations() end,
            gr = function() require('telescope.builtin').lsp_references() end,
            ['<space>f'] = vim.lsp.buf.format,
        },
        inlay_hints = {
            enabled = true,
            debug = true,
        },
        servers = {
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
                                args = { '--ignore=E501' }
                            },
                            pylint = {
                                enabled = false,
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
            ts_ls = {
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = 'all',
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        }
                    },
                }
            },
            -- denols = {},
            clojure_lsp = {},
            jsonnet_ls = {},
            zls = {
                cmd = { '/Users/jun/Documents/workspace/zls/zig-out/bin/zls', '--enable-debug-log' },
                settings = {
                    zls = {
                        enable_inlay_hints = true,
                        inlay_hints_show_builtin = true,
                        inlay_hints_exclude_single_argument = true,
                        inlay_hints_hide_redundant_param_names = true,
                        inlay_hints_hide_redundant_param_names_last_token = true,
                    }
                }
            },
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
                        },
                    },
                },
            },
            -- bufls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        },
                        hint = {
                            enable = true,
                            arrayIndex = 'Disable',
                        },
                    }
                }
            },
            ['rust_analyzer@2024-11-11'] = {
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
                        inlayHints = {
                            closureReturnTypeHints = {
                                enable = true
                            },
                        },
                        cache = {
                            warmup = false,
                        }
                    },
                },
            }
        }
    },
}
