local util = require'util'

local actions = require('telescope.actions')
require'telescope'.setup{
    defaults = {
        layout_config = {
            horizontal = {
                width = 0.75,
                height = 0.5
            }
        },
        mappings = {
            i = {
                ['<esc>'] = actions.close,
            },
        }
    }
}
util.map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
util.map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
util.map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
util.map('n', ';', '<cmd>Telescope commands<cr>')
