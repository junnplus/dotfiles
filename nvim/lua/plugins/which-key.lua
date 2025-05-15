return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  ---@module 'which
  ---@type wk.Opts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    preset = 'helix'
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
