local g = vim.g
local cmd = vim.cmd

-- Leader key
g.mapleader = [[ ]]

-- reopen last position
cmd([[ autocmd BufReadPost * normal! g`" ]])

require('plugins')
require('core')
require('mapping')
require('filetype')

cmd [[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
augroup END
]]
