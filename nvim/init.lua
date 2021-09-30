local g = vim.g
local cmd = vim.cmd

-- Leader key
g.mapleader = [[ ]]

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

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
