local map = require('util').map

-- Key bindings
map('', '<c-a>', 'ggVG$"+y')
map('v', '<c-c>', '"+y')
map('n', '<tab>', 'V')
map('n', '<s-tab>', 'V<')
map('v', '<tab>', '>gv')
map('v', '<s-tab>', '<gv')
map('i', '<c-b>', '<c-o>b')
map('i', '<c-f>', '<c-o>l')
map('i', '<c-j>', '<c-o>j')
map('i', '<c-k>', '<c-o>k')
map('c', '<c-b>', '<Left>')
map('c', '<c-f>', '<Right>')
