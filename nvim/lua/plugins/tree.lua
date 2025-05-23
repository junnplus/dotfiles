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
          and vim.api.nvim_get_option_value('filetype', { buf = vim.api.nvim_win_get_buf(layout[2]) }) == 'NvimTree'
          and layout[3] == nil then
        vim.cmd('confirm quit')
      end
    end

    vim.api.nvim_create_autocmd('VimEnter', { callback = open_nvim_tree })
    vim.api.nvim_create_autocmd('BufEnter', { callback = close_nvim_tree })
  end,
  opts = {
    on_attach = function(bufnr)
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      local api = require('nvim-tree.api')
      api.config.mappings.default_on_attach(bufnr)
      map('n', '<C-v>', api.node.open.vertical, { desc = 'Open vertical split' })
      map('n', '<C-s>', api.node.open.horizontal, { desc = 'Open horizontal split' })
      map('n', 'v', api.node.open.vertical, { desc = 'Open vertical split' })
      map('n', 's', api.node.open.horizontal, { desc = 'Open horizontal split' })
      map('n', '[d', api.node.navigate.diagnostics.prev, { desc = 'Prev diagnostic' })
      map('n', ']d', api.node.navigate.diagnostics.next, { desc = 'Next diagnostic' })
      -- map('n', 'r', api.fs.rename_sub, { buffer = bufnr })

      map('n', '<C-t>', function() require('toggleterm').toggle() end, { desc = 'Toggle terminal' })
      map('n', '-', function() require('chowcho').run() end, { desc = 'Choice Window' })
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
      -- highlight_opened_files = '1',
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
