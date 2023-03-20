return {
    'j-hui/fidget.nvim', -- nvim-lsp progress
    event = "BufReadPre",
    opts = {
        text = {
            done = '[✓]',
        },
        fmt = {
            stack_upwards = false,
        },
    },
}
