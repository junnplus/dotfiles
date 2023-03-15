local map = require('utils').map

return {
    'tkmpypy/chowcho.nvim',
    keys = { '-' },
    init = function()
        map('n', '-', require('chowcho').run, { noremap = false })
    end
}
