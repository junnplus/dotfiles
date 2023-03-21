return {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        highlight = {
            -- bg conflects with linehl of gitsigns
            keyword = 'fg',
            after = '',
        },
    }
}
