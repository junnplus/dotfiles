local tree_cb = require('nvim-tree.config').nvim_tree_callback
require('nvim-tree').setup({
    renderer = {
        indent_markers = { enable = true },
        highlight_git = true,
        highlight_opened_files = '1',
        icons = {
            glyphs = {
                symlink = '',
                git = {
                    deleted = '',
                    ignored = '◌',
                    renamed = '➜',
                    staged = '+',
                    unmerged = '',
                    untracked = '?',
                    -- unstaged = 'ϟ',
                },
                folder = {
                    arrow_open = '',
                    arrow_closed = '',
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                    symlink_open = '',
                },
            }
        }
    },
    view = {
        width = 35,
        side = 'left',
        mappings = {
            list = {
                { key = '<C-v>', cb = tree_cb('vsplit') },
                { key = '<C-s>', cb = tree_cb('split') },
                { key = 'v',     cb = tree_cb('vsplit') },
                { key = 's',     cb = tree_cb('split') },
                { key = '-',     cb = '<Plug>(choosewin)' },
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
    update_focused_file = {
        enable = true,
    },
    hijack_netrw = true,
    update_cwd = true,
    reload_on_bufenter = true,
})

local function open_nvim_tree()
    require("nvim-tree.api").tree.toggle({ focus = false })
end

local function close_nvim_tree()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf"
        and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
        and layout[3] == nil then
        vim.cmd("confirm quit")
    end
end

vim.api.nvim_create_autocmd('VimEnter', { callback = open_nvim_tree })
vim.api.nvim_create_autocmd("BufEnter", { callback = close_nvim_tree })
