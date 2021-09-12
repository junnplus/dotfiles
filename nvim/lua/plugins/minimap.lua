local g = vim.g
local cmd = vim.cmd

cmd([[hi MinimapCurrentLine guifg=#50FA7B]])

g.minimap_width = 10
-- g.minimap_auto_start = 1
g.minimap_auto_start_win_enter = 1
g.minimap_highlight = 'MinimapCurrentLine'
