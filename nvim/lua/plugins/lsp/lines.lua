return {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    event = 'VeryLazy',
    enabled = false,
    init = function()
        vim.diagnostic.config({
            virtual_text = true,
        })
    end,
    config = true
}
