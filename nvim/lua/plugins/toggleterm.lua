local map = require('utils').map

return {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    init = function()
        map('t', '<C-]>', [[<C-\><C-n>]], { noremap = true })
    end,
    opts = {
        open_mapping = [[<C-t>]],
        size = function(term)
            if term.direction == 'horizontal' then
                return 15
            else
                return vim.o.columns * 0.3
            end
        end,
    },
}
