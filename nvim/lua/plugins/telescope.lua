local map = require('utils').map
return {
    'nvim-telescope/telescope.nvim',
    -- keys = { '<leader>ff', '<leader>fg', '<leader>fb', ';' },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-github.nvim',
    },
    opts = function()
        local actions = require('telescope.actions')
        return {
            defaults = {
                layout_config = {
                    horizontal = {
                        width = 0.75,
                        height = 0.5,
                    },
                },
                mappings = {
                    i = {
                        ['<esc>'] = actions.close,
                        ['<C-j>'] = actions.move_selection_previous,
                        ['<C-k>'] = actions.move_selection_next,
                        ['<C-l>'] = { '<Right>', type = 'command' },
                        ['<C-h>'] = { '<Left>', type = 'command' },
                        ['<C-f>'] = actions.preview_scrolling_down,
                        ['<C-b>'] = actions.preview_scrolling_up,
                    },
                },
            },
        }
    end,
    config = function(_, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension('gh')
        map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
        map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
        map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
        map('n', ';', '<cmd>Telescope commands<cr>')
    end,
}
