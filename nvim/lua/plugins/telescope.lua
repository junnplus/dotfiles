local utils = require('utils')

local actions = require('telescope.actions')
require('telescope').setup({
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
})
require('telescope').load_extension('gh')
require('telescope').load_extension('packer')
utils.map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
utils.map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
utils.map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
utils.map('n', ';', '<cmd>Telescope commands<cr>')
