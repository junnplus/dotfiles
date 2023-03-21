return {
    'nvim-tree/nvim-tree.lua',
    event = 'VeryLazy',
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function()
        local function open_nvim_tree()
            require('nvim-tree.api').tree.find_file({ open = true })
        end

        local function close_nvim_tree()
            local layout = vim.api.nvim_call_function('winlayout', {})
            if layout[1] == 'leaf'
                and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), 'filetype') == 'NvimTree'
                and layout[3] == nil then
                vim.cmd('confirm quit')
            end
        end

        vim.api.nvim_create_autocmd('VimEnter', { callback = open_nvim_tree })
        vim.api.nvim_create_autocmd('BufEnter', { callback = close_nvim_tree })
    end,
    opts = {
        on_attach = function(bufnr)
            local map = require('utils').map
            local api = require('nvim-tree.api')
            api.config.mappings.default_on_attach(bufnr)
            map('n', '<C-v>', api.node.open.vertical, { buffer = bufnr })
            map('n', '<C-s>', api.node.open.horizontal, { buffer = bufnr })
            map('n', 'v', api.node.open.vertical, { buffer = bufnr })
            map('n', 's', api.node.open.horizontal, { buffer = bufnr })
            map('n', '<C-t>', ':ToggleTerm<CR>', { buffer = bufnr })
            map('n', '-', ':lua require("chowcho").run()<CR>', { buffer = bufnr })
            map('n', '[d', api.node.navigate.diagnostics.prev, { buffer = bufnr })
            map('n', ']d', api.node.navigate.diagnostics.next, { buffer = bufnr })
            map('n', 'r', api.fs.rename_sub, { buffer = bufnr })
        end,
        renderer = {
            indent_markers = {
                enable = true,
                icons = {
                    item = '|',
                    edge = '|',
                    corner = '┗',
                }
            },
            highlight_git = true,
            highlight_opened_files = '1',
            icons = {
                git_placement = 'after',
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
    }
}
