return {
    'j-hui/fidget.nvim', -- nvim-lsp progress
    event = 'VeryLazy',
    opts = {
        text = {
            done = '[✓]',
        },
        fmt = {
            stack_upwards = false,
        },
    },
}
