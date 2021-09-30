local map = require('util').map

require('hop').setup {}

map('n', '<leader>w', "<cmd>HopWordAC<cr>")
map('n', '<leader>s', "<cmd>HopChar1<cr>")
map('n', '<leader>k', "<cmd>HopLineStartBC<cr>")
map('n', '<leader>j', "<cmd>HopLineStartAC<cr>")
map('v', '<leader>k', "<cmd>HopLineStartBC<cr>")
map('v', '<leader>j', "<cmd>HopLineStartAC<cr>")