return {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
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
        linehl = false,
        numhl = true,
        sign_priority = 6,
    }
}
