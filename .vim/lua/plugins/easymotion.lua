local g = vim.g
local cmd = vim.cmd
local map = require('util').map

g.EasyMotion_smartcase = 1
g.EasyMotion_do_mapping = 0
-- map('', '<leader>l', '<Plug>(easymotion-lineforward)', {noremap = false})
-- map('', '<leader>j', '<Plug>(easymotion-j)', {noremap = false})
-- map('', '<leader>k', '<Plug>(easymotion-k)', {noremap = false})
-- map('', '<leader>h', '<Plug>(easymotion-linebackward)', {noremap = false})
-- map('', '<leader>w', '<Plug>(easymotion-w)', {noremap = false})
map('', '<leader>s', '<Plug>(easymotion-overwin-f)', {noremap = false})
cmd([[ autocmd User EasyMotionPromptBegin :lua vim.lsp.diagnostic.disable() ]])
cmd([[ autocmd User EasyMotionPromptEnd :lua vim.lsp.diagnostic.enable() ]])
