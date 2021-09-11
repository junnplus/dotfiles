local o, wo, bo = vim.o, vim.wo, vim.bo
local cmd = vim.cmd
local set = require('util').set

-- Color scheme
set('background', 'dark')
set('termguicolors', true)
cmd [[colorscheme tokyonight]]

-- Settings
local buffer = {o, bo}
local window = {o, wo}

set('langmenu', 'zh_CN.UTF-8')
set('helplang', 'cn')
set('encoding', 'utf-8')
set('fencs', 'utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936')
set('hidden', true)
set('wildmenu', true)
set('hlsearch', true)
set('incsearch', true)
set('matchtime', 1)
set('showmatch', true)
set('updatetime', 100)
set('ignorecase', true)
set('smarttab', true)
set('expandtab', true)
set('laststatus', 2)
set('showcmd', true)
set('ruler', true)
set('history', 300)
set('backup', false)
set('swapfile', false)
set('foldenable', false)
set('autoread', true)
set('autowrite', true)
set('mouse', 'a')

set('number', true, window)
set('relativenumber', true, window)
set('cursorline', true, window)
set('cursorcolumn', true, window)
set('signcolumn', 'auto:2')

set('textwidth', 120, buffer)
set('smartindent', true, buffer)
set('autoindent', true, buffer)
set('cindent', true, buffer)
set('shiftwidth', 4, buffer)
set('softtabstop', 4, buffer)
set('tabstop', 4, buffer)
