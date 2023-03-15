local settings = {
    mappings = {
        gd = 'lua require"telescope.builtin".lsp_definitions()',
        gi = 'lua require"telescope.builtin".lsp_implementations()',
        gr = 'lua require"telescope.builtin".lsp_references()',
        ['<space>f'] = 'lua vim.lsp.buf.format()',
    },
    servers = {
        eslint = {},
        pylsp = {
            settings = {
                pylsp = {
                    -- PylspInstall python-lsp-black
                    -- PylspInstall pyls-isort
                    configurationSources = { "flake8" },
                    plugins = {
                        pycodestyle = {
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
        clangd = {},
        solc = {},
        lua_ls = {},
        ['rust_analyzer@nightly'] = {
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
        }
    },
}

require('neodev').setup()
require('lsp-setup').setup(settings)
require('lsp_lines').setup()

-- global config for diagnostic
vim.diagnostic.config({
    underline = true,
    virtual_text = false,
})

require('lsp_signature').setup()
require('lsp-colors').setup()

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

require("lsp-inlayhints").setup()
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
    group = "LspAttach_inlayhints",
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp-inlayhints").on_attach(client, bufnr)
    end,
})
