require('gitsigns').setup({
    signs = {
        add = { hl = 'GitSignsAdd', text = '┋', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change = { hl = 'GitSignsChange', text = '┋', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete = { hl = 'GitSignsDelete', text = '⇉', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = { hl = 'GitSignsDelete', text = '⇊', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
    keymaps = {
        -- Default keymap options
        noremap = true,

        ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
        ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },
    },
    word_diff = false,
    current_line_blame = true,
    linehl = true,
    numhl = true,
    sign_priority = 6,
    count_chars = {
        [1] = '1', -- '₁',
        [2] = '2', -- '₂',
        [3] = '3', -- '₃',
        [4] = '4', -- '₄',
        [5] = '5', -- '₅',
        [6] = '6', -- '₆',
        [7] = '7', -- '₇',
        [8] = '8', -- '₈',
        [9] = '9', -- '₉',
        ['+'] = '', -- '₊',
    },
})
