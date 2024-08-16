return {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        defaults = {
            layout_config = {
                horizontal = {
                    width = 0.75,
                    height = 0.5,
                },
            },
            mappings = {
                i = {
                    ['<esc>'] = 'close',
                    ['<C-j>'] = 'move_selection_previous',
                    ['<C-k>'] = 'move_selection_next',
                    ['<C-l>'] = { '<Right>', type = 'command' },
                    ['<C-h>'] = { '<Left>', type = 'command' },
                    ['<C-f>'] = 'preview_scrolling_down',
                    ['<C-b>'] = 'preview_scrolling_up',
                },
            },
            file_ignore_patterns = { '^vendor/', '^.git/' },
        },
    },
    keys = {
        {
            '<leader>ff',
            '<cmd>Telescope find_files<cr>',
        },
        {
            '<leader>fg',
            '<cmd>Telescope live_grep<cr>',
        },
        {
            '<leader>b',
            '<cmd>Telescope buffers<cr>',
        },
        {
            ';',
            '<cmd>Telescope commands<cr>',
        }
    },
}
