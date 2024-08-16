return {
    'princejoogie/dir-telescope.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('dir-telescope').setup()
        require('telescope').load_extension('dir')
    end,
}
