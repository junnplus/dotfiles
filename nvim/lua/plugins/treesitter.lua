return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'VeryLazy',
  lazy = vim.fn.argc(-1) == 0,
  dependencies = {
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-textobjects',
    -- 'nvim-treesitter/nvim-treesitter-context',
    'RRethy/nvim-treesitter-endwise',
    -- 'andymass/vim-matchup', -- extend % key
    'yioneko/nvim-yati',
  },
  init = function()
    local ncmd = vim.api.nvim_command
    ncmd('set foldmethod=expr')
    ncmd('set foldexpr=nvim_treesitter#foldexpr()')
    vim.filetype.add({
      pattern = {
        ['%.env%.[%w_.-]+'] = 'sh',
      }
    })
  end,
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    ensure_installed = {
      'c', 'lua', 'rust', 'go', 'python',
      'zig', 'markdown', 'solidity', 'jsonnet', 'vim', 'graphql'
    },
    highlight = {
      enable = true,
    },
    playground = {
      enable = true,
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { 'BufWrite', 'CursorHold' },
    },
    indent = { enable = false },
    autopairs = { enable = true },
    rainbow = { enable = true },
    autotag = { enable = true },
    context_commentstring = { enable = true },
    -- RRethy/nvim-treesitter-endwise
    endwise = {
      enable = true,
    },
    -- andymass/vim-matchup
    -- matchup = {
    --     enable = true,
    -- },
    -- nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
      },
    },
    -- yioneko/nvim-yati
    yati = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
