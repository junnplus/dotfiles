return {
    'j-hui/fidget.nvim', -- nvim-lsp progress
    branch = 'legacy',
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
