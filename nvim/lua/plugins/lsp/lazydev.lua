return {
  'folke/lazydev.nvim',
  event = 'VeryLazy',
  ft = { 'lua' },
  opts = {
    library = {
      -- See the configuration section for more details
      -- Load luvit types when the `vim.uv` word is found
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      '~/Documents/workspace/lsp-setup.nvim',
    },
  },
}
