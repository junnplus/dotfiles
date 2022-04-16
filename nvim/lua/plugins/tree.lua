local g = vim.g

g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_icons = {
    symlink = '',
    git = {
        untracked = '?',
    },
    folder = {
        arrow_open = '',
        arrow_closed = '',
        default = '',
        open = '',
    },
}
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}

local tree_cb = require('nvim-tree.config').nvim_tree_callback
require('nvim-tree').setup({
    view = {
        width = 35,
        side = 'left',
        mappings = {
            list = {
                { key = '<C-v>', cb = tree_cb('vsplit') },
                { key = '<C-s>', cb = tree_cb('split') },
                { key = 'v', cb = tree_cb('vsplit') },
                { key = 's', cb = tree_cb('split') },
                { key = '-', cb = '<Plug>(choosewin)' },
                { key = '<C-t>', cb = ':ToggleTerm<cr>' },
            },
        },
    },
    diagnostics = {
        enable = true,
        icons = {
            error = '',
            warning = '',
            info = '',
            hint = '',
        },
    },
    update_to_buf_dir = {
        enable = true,
        auto_update = true,
    },
    update_focused_file = {
        enable = true,
    },
    auto_close = true,
    hijack_netrw = true,
    update_cwd = true,
    focus_tree = false,
    open_on_setup = true,
})

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        require('nvim-tree').toggle(false, true)
    end,
})
