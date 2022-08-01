local M = {}

function M.map(modes, lhs, rhs, opts)
    -- noremap = true, slient = true, expr = false
    opts = opts or {}
    opts.noremap = opts.noremap == nil and true or opts.noremap
    if type(modes) == 'string' then
        modes = { modes }
    end
    for _, mode in ipairs(modes) do
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

return M
