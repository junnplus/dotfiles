local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=main',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy.view.config').keys.close = '<esc>'
require('lazy').setup({
    spec = {
        { import = 'plugins' },
        { import = 'plugins.lsp' },
    },
    ui = {
        border = 'rounded',
        icons = {
            task = ' ',
        }
    },
    change_detection = {
        notify = false,
    }
})
vim.keymap.set('n', '<leader>z', ':Lazy<cr>')
