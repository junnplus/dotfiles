local map = vim.keymap.set

-- Key bindings
map('', '<c-a>', 'ggVG$"+y')
map('v', '<c-c>', '"+y')
map('v', '<tab>', '>gv')
map('v', '<s-tab>', '<gv')
map('i', '<c-b>', '<c-o>b')
map('i', '<c-f>', '<c-o>l')
map('i', '<c-h>', '<c-o>h')
map('i', '<c-l>', '<c-o>l')
map('i', '<c-j>', '<c-o>j')
map('i', '<c-k>', '<c-o>k')
map('c', '<c-h>', '<Left>')
map('c', '<c-l>', '<Right>')
map('c', '<c-b>', '<Left>')
map('c', '<c-f>', '<Right>')
