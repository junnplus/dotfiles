return {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    keys = {
        { mode = { 'n' }, '<C-t>', ':ToggleTerm<CR>' },
    },
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
