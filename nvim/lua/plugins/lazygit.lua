return {
  'kdheepak/lazygit.nvim',
  enabled = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' }
  }
}
