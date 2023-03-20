return {
    'nvim-tree/nvim-web-devicons',
    event = 'BufReadPost',
    opts = {
        override = {
            zsh = {
                icon = '',
                color = '#428850',
                name = 'Zsh',
            },
        },
        default = true,
    }
}
