local map = require('utils').map

return {
    'phaazon/hop.nvim',
    -- keys = { 's', 'h', 'j', 'k', 'l', '<leader>j' },
    event = 'BufRead',
    config = true,
    init = function()
        map('n', 's', '<cmd>HopChar2<cr>')
        map('n', '<leader>w', '<cmd>HopWordAC<cr>')
        map('n', '<leader>k', '<cmd>HopLineStart<cr>')
        map('n', '<leader>j', '<cmd>HopLineStart<cr>')
        map('v', '<leader>k', '<cmd>HopLineStart<cr>')
        map('v', '<leader>j', '<cmd>HopLineStart<cr>')
        map('n', '<leader>h', '<cmd>HopWordBC<cr>')
        map('n', '<leader>l', '<cmd>HopWordAC<cr>')
        map('v', '<leader>h', '<cmd>HopWordBC<cr>')
        map('v', '<leader>l', '<cmd>HopWordAC<cr>')
    end,
}
