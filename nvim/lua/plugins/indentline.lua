require('indent_blankline').setup({
    char = '|',
    buftype_exclude = { 'terminal' },
    show_trailing_blankline_indent = false,
    -- show_current_context = true,
    use_treesitter = true,
})
