require('gitsigns').setup({
    signs = {
        add = { text = '▌' },
        change = { text = '▌' },
        delete = { text = '▌' },
        topdelete = { text = '▌' },
        changedelete = { text = '▌' },
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
    -- count_chars = {
    --     [1] = '1', -- '₁',
    --     [2] = '2', -- '₂',
    --     [3] = '3', -- '₃',
    --     [4] = '4', -- '₄',
    --     [5] = '5', -- '₅',
    --     [6] = '6', -- '₆',
    --     [7] = '7', -- '₇',
    --     [8] = '8', -- '₈',
    --     [9] = '9', -- '₉',
    --     ['+'] = '', -- '₊',
    -- },
})
