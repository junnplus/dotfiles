local g = vim.g

local border_chars = {
    TOP_LEFT = '╭',
    TOP_RIGHT = '╮',
    MID_HORIZONTAL = '─',
    MID_VERTICAL = '│',
    BOTTOM_LEFT = '╰',
    BOTTOM_RIGHT = '╯',
}

g.lsp_utils_location_opts = {
    mode = 'split',
    preview = {
        title = 'Location Preview',
        border = true,
        border_chars = border_chars,
    },
    keymaps = {
        n = {
            ['<C-n>'] = 'j',
            ['<C-p>'] = 'k',
        },
    },
}
