local api = vim.api
local cmd = vim.cmd
local nvim_lsp = require'lspconfig'

cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local signs = { Error = "", Warning = "", Hint = "", Information = "" }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local if_nil = vim.F.if_nil
local publish_diagnostic = function(_, params, ctx, config)
    local uri = params.uri
    local client_id = ctx.client_id

    local bufnr = vim.uri_to_bufnr(uri)
    if not bufnr then
        return
    end

    local diagnostics = params.diagnostics
    config = config or {}

    if if_nil(config.severity_sort, false) then
        table.sort(diagnostics, function(a, b) return a.severity > b.severity end)
    end

    vim.lsp.diagnostic.save(diagnostics, bufnr, client_id)

    if not vim.api.nvim_buf_is_loaded(bufnr) then
        return
    end
    -- don't mutate the original diagnostic because it would interfere with
    -- code action (and probably other stuff, too)
    local prefixed_diagnostics = vim.deepcopy(diagnostics)
    for i, v in pairs(diagnostics) do
      prefixed_diagnostics[i].message = string.format("%s: %s", v.source, v.message)
    end

    vim.lsp.diagnostic.display(prefixed_diagnostics, bufnr, client_id, config)
end

local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(publish_diagnostic, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4 },
    severity_sort = true,
})
-- vim.lsp.handlers["textDocument/definition"] = goto_definition('vsplit')
-- vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler

local orig_set_signs = vim.lsp.diagnostic.set_signs
local set_signs_limited = function (diagnostics, bufnr, client_id, sign_ns, opts)
    if not diagnostics then
        return
    end

    local max_severity_per_line = {}
    for _,d in pairs(diagnostics) do
        if max_severity_per_line[d.range.start.line] then
            local current_d = max_severity_per_line[d.range.start.line]
            if d.severity < current_d.severity then
                max_severity_per_line[d.range.start.line] = d
            end
        else
            max_severity_per_line[d.range.start.line] = d
        end
    end

    local filtered_diagnostics = {}
    for _,v in pairs(max_severity_per_line) do
        table.insert(filtered_diagnostics, v)
    end

    -- call original function
    opts = opts or {}
    opts.priority = 10
    orig_set_signs(filtered_diagnostics, bufnr, client_id, sign_ns, opts)
end
vim.lsp.diagnostic.set_signs = set_signs_limited

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }

local luadev = require'lua-dev'.setup{
    lspconfig = {
        settings = {
            Lua = {
                -- runtime = {
                --   -- LuaJIT in the case of Neovim
                --   version = "LuaJIT",
                --   path = vim.split(package.path, ";"),
                -- },
                diagnostics = {
                  -- Get the language server to recognize the `vim` global
                  globals = { "vim" },
                },
                workspace = {
                  -- Make the server aware of Neovim runtime files
                  checkThirdParty = false,
                  -- library = {
                  --   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  --   [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                  -- },
                },
            }
        },
    }
}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<space>n', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    if client.resolved_capabilities.document_formatting then
        vim.cmd [[
          augroup Format
            au! * <buffer>
            au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
          augroup END
        ]]
    end
end

-- local servers = { 'clangd', 'pyright', 'tsserver', 'gopls', 'vimls' }
local servers = require"lspinstall".installed_servers()
for _, lsp in ipairs(servers) do
    local config = {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 500,
        }
    }
    if lsp == 'lua' then
        config = vim.tbl_deep_extend('force', config, luadev)
    end
    -- if lsp == 'gopls' then
    --     config.settings = {
    --         golsp = {
    --             gofumpt = true,
    --             staticcheck = true,
    --             usePlaceholders = true,
    --             codelenses = {
    --                 gc_details = true,
    --             },
    --         }
    --     }
    -- end
    nvim_lsp[lsp].setup(config)
end
-- vim.cmd [[ autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false}) ]]
