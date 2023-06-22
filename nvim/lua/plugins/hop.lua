return {
    'phaazon/hop.nvim',
    event = 'VeryLazy',
    config = true,
    keys = {
        {
            's',
            '<cmd>HopChar2<cr>',
        },
        {
            '<leader>w',
            '<cmd>HopWordAC<cr>',
        },
        {
            '<leader>k',
            mode = { 'n', 'v' },
            '<cmd>HopLineStart<cr>',
        },
        {
            '<leader>j',
            mode = { 'n', 'v' },
            '<cmd>HopLineStart<cr>',
        },
    },
}
