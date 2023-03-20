local map = require('utils').map

return {
    'tkmpypy/chowcho.nvim',
    event = 'BufReadPost',
    init = function()
        map('n', '-', require('chowcho').run, { noremap = false })
    end
}
