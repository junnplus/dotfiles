local map = require('utils').map

require('bufferline').setup({
    options = {
        show_buffer_icons = true,
        diagnostics = 'nvim_lsp',
        indicator_icon = '▎',
        show_close_icon = false,
        modified_icon = '✥',
    },
})

map('', '=', '<cmd>BufferLinePick<cr>')
