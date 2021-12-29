local g = vim.g

g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_icons = {
    symlink = '',
    lsp = {
        hint = '',
        info = '',
        warning = '',
        error = '',
    },
    git = {
        untracked = '?'
    },
    folder = {
        arrow_open = '',
        arrow_closed = '',
        default = '',
        open = '',
    }
}
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1
}

local tree_cb = require('nvim-tree.config').nvim_tree_callback
require('nvim-tree').setup {
    view = {
        width = 35,
        side = 'left',
        mappings = {
            list = {
                { key = "<C-v>", cb = tree_cb("vsplit") },
                { key = "<C-s>", cb = tree_cb("split") },
                { key = "v", cb = tree_cb("vsplit") },
                { key = "s", cb = tree_cb("split") },
                { key = "-", cb = '<Plug>(choosewin)' },
            }
        }
    },
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
    },
    auto_close = true,
    hijack_netrw = true,
    focus_tree = false,
    open_on_setup = true,
}

require('nvim-tree.events').on_nvim_tree_ready(function()
    vim.cmd('NvimTreeToggle')
    vim.cmd('wincmd p')
end)
