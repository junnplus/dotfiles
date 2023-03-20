return {
    'jackMort/ChatGPT.nvim',
    cmd = { 'ChatGPT', 'ChatGPTActAs' },
    dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim'
    },
    opts = {
        keymaps = {
            submit = '<C-m>'
        }
    }
}
