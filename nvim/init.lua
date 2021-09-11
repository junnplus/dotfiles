local g = vim.g
local cmd = vim.cmd
local ncmd = vim.api.nvim_command
--
-- Leader key
g.mapleader = [[ ]]
--
-- reopen last position
cmd([[ autocmd BufReadPost * normal! g`" ]])

ncmd('filetype plugin indent on')
cmd([[ autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120 ]])
cmd([[ autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120 ]])
cmd([[ autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]])
cmd([[ autocmd FileType go setlocal tabstop=8 shiftwidth=8 softtabstop=8 textwidth=120 noexpandtab ]])
cmd([[ autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 ]])
cmd([[ autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 expandtab ]])
cmd([[ autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120 ]])
cmd([[ autocmd FileType less,sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120 ]])
cmd([[ autocmd FileType javascript,javascript.jsx,javascriptreact,typescript,typescriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]])

require('core')
require('plugins.lsp')
require('plugins.nerdcommenter')
require('plugins.floaterm')
require('plugins.tagbar')
require('plugins.indentline')
require('plugins.devicons')
require('plugins.choosewin')
require('plugins.easymotion')
require('plugins.cmp')
require('plugins.treesitter')
require('plugins.bufferline')
require('plugins.airline')
require('plugins.autopairs')
require('plugins.tree')
require('plugins.trouble')
require('plugins.gitsigns')
require('plugins.todo')
require('plugins.telescope')
require('mapping')
