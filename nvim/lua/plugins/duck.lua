return {
    'tamton-aquib/duck.nvim',
    init = function()
        vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦀") end, {})
        vim.keymap.set('n', '<leader>dk', require("duck").cook, {})
    end
}
