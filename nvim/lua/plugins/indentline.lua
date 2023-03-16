return {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    opts = {
        char = '|',
        buftype_exclude = { 'terminal', 'NvimTree', 'nofile' },
        show_trailing_blankline_indent = false,
        -- show_current_context = true,
        use_treesitter = true,
    },
}
