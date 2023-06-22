return {
    'tkmpypy/chowcho.nvim',
    event = 'VeryLazy',
    keys = {
        {
            '-',
            mode = { 'n' },
            function()
                require('chowcho').run()
            end,
        }
    }
}
