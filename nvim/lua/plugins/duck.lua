return {
    'tamton-aquib/duck.nvim',
    init = function()
        vim.keymap.set('n', '<leader>dd', require("duck").hatch, {})
        vim.keymap.set('n', '<leader>dk', require("duck").cook, {})
    end
}
