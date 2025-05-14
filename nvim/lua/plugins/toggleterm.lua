return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  keys = {
    { '<C-t>', ':ToggleTerm<CR>' },
    {
      '<leader>lg',
      function()
        require('toggleterm.terminal').Terminal:new({ cmd = 'lazygit', hidden = true }):toggle()
      end,
      desc = 'LazyGit',
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
