return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    init = function()
        require('tokyonight').load()
    end,
    opts = {
        style = 'night',
    },
}
