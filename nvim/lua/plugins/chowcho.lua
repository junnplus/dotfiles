local map = require('utils').map

return {
    'tkmpypy/chowcho.nvim',
    event = 'VeryLazy',
    init = function()
        map('n', '-', function() require('chowcho').run() end, { noremap = false })
    end
}
