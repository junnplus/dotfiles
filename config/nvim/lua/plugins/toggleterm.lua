return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>t', ':ToggleTerm<CR>', desc = 'Toggle terminal' },
    {
      '<leader>g',
      function()
        local Terminal = require('toggleterm.terminal').Terminal
        Terminal:new({ cmd = 'lazygit', hidden = true, direction = 'float', }):toggle()
      end,
      desc = 'LazyGit',
    },
    {
      '<leader>d',
      function()
        local Terminal = require('toggleterm.terminal').Terminal
        Terminal:new({ cmd = 'lazydocker', hidden = true, direction = 'float', }):toggle()
      end,
      desc = 'LazyDocker',
    }
  },
  opts = {
    open_mapping = [[<C-t>]],
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      else
        return vim.o.columns * 0.3
      end
    end,
  },
}
