local map = require('utils').map
return {
    'nvim-telescope/telescope.nvim',
    -- keys = { '<leader>ff', '<leader>fg', '<leader>fb', ';' },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-github.nvim',
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
        },
    },
    init = function()
        require('telescope').load_extension('gh')
        map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
        map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
        map('n', '<c-o>', '<cmd>Telescope buffers<cr>')
        map('n', ';', '<cmd>Telescope commands<cr>')
    end,
}
