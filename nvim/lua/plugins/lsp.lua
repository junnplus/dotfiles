local settings = {
    mappings = {
        gd = 'lua require"telescope.builtin".lsp_definitions()',
        gi = 'lua require"telescope.builtin".lsp_implementations()',
        gr = 'lua require"telescope.builtin".lsp_references()',
    },
    -- on_attach = function(client, bufnr)
    --     require('lsp-format').on_attach(client)
    --     require('lsp-inlayhints').on_attach(bufnr, client)
    -- end,
    servers = {
        eslint = {},
        pylsp = {},
        zk = {},
        jsonls = {},
        bashls = {},
        tsserver = {},
        clojure_lsp = {},
        dockerls = {},
        zls = {},
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
        clangd = {},
        solc = {},
        sumneko_lua = require('lua-dev').setup(),
        ['rust_analyzer@nightly'] = require('lsp-setup.rust-tools').setup({
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
        })
    },
}

-- require('lsp-format').setup({
--     lua = { sync = true },
--     rust = { sync = true },
-- })
-- require('lsp-inlayhints').setup()
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
