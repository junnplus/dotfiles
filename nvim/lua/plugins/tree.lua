local g = vim.g

require('nvim-tree.events').on_nvim_tree_ready(function ()
    vim.cmd('NvimTreeToggle')
    vim.cmd('wincmd p')
    -- vim.cmd('NvimTreeRefresh')
end)
local tree_cb = require('nvim-tree.config').nvim_tree_callback

g.nvim_tree_side = 'left'
g.nvim_tree_width = 35
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
g.nvim_tree_auto_close = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hijack_cursor = 0
-- g.nvim_tree_update_cwd = 1
-- g.nvim_tree_follow_update_path = 1
g.nvim_tree_follow = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_hijack_netrw = 0
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_icons = {
    symlink = '',
    lsp = {
        hint = '',
        info = '',
        warning = '',
        error = '',
    }
}
g.nvim_tree_bindings = {
    { key = "<C-v>", cb = tree_cb("vsplit") },
    { key = "<C-s>", cb = tree_cb("split") },
    { key = "v", cb = tree_cb("vsplit") },
    { key = "s", cb = tree_cb("split") },
    { key = "-", cb = '<Plug>(choosewin)' },
}
