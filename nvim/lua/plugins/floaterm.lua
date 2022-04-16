local g = vim.g
local map = require('utils').map

g.floaterm_autoclose = 2
g.floaterm_autohide = 'v:false'
g.floaterm_height = 0.4
g.floaterm_position = 'bottomright'
g.floaterm_keymap_toggle = '<c-t>'

map('n', '<leader>r', 'V:FloatermSend<CR>:FloatermToggle<CR>')
map('v', '<leader>r', ':FloatermSend<CR>:FloatermToggle<CR>')
