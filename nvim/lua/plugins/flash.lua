return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {},
  -- stylua: ignore
  keys = {
    {
      '<leader>s',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash'
    },
    {
      '<leader>S',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter'
    },
    {
      '<c-s>',
      mode = { 'c' },
      function()
        require('flash').toggle()
      end,
      desc = 'Toggle Flash Search'
    },
    {
      '<leader>j',
      mode = { 'n', 'v' },
      function()
        require('flash').jump({
          search = { mode = 'search', max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = '^',
        })
      end,
    },
    {
      '<leader>k',
      mode = { 'n', 'v' },
      function()
        require('flash').jump({
          search = { mode = 'search', max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = '^',
        })
      end,
    }
  },
}
