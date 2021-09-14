-- local cmd = vim.cmd

-- cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
-- cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])
-- cmd [[ autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false}) ]]

local publish_diagnostic = function(_, params, ctx, config)
    local uri = params.uri
    local client_id = ctx.client_id

    local bufnr = vim.uri_to_bufnr(uri)
    if not bufnr then
        return
    end

    local diagnostics = params.diagnostics
    config = config or {}

    if vim.F.if_nil(config.severity_sort, false) then
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
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
})
-- vim.lsp.handlers["textDocument/definition"] = goto_definition('vsplit')
local function compat_handler(stable_fn)
	return function(err, result, ctx, config)
		stable_fn(err, ctx.method, result, ctx.client_id, ctx.bufnr, config)
	end
end
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = compat_handler(require('lsputil.locations').references_handler)

local signs = { Error = "", Warning = "", Hint = "", Information = "" }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

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
