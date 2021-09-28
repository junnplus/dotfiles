local g = vim.g

g.nvim_tree_indent_markers = 1
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
    }
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
    update_focused_file = {
        enable = true,
    },
    auto_close = true,
    follow = true,
    hijack_netrw = false,
    lsp_diagnostics = true,
}

require('nvim-tree.events').on_nvim_tree_ready(function()
    vim.cmd('NvimTreeToggle')
    vim.cmd('wincmd p')
end)
