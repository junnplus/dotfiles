local M = {}

function M.map(modes, lhs, rhs, opts)
    -- noremap = true, slient = true, expr = false
    opts = opts or {}
    opts.noremap = opts.noremap == nil and true or opts.noremap
    if type(modes) == 'string' then
        modes = { modes }
    end
    for _, mode in ipairs(modes) do
        vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    end
end

function M.set(opt, v, scopes)
    scopes = scopes or { vim.o }
    for _, s in ipairs(scopes) do
        s[opt] = v
    end
end

function M.t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.input(keys, mode)
    vim.api.nvim_feedkeys(M.t(keys), mode or 'i', true)
end

return M
