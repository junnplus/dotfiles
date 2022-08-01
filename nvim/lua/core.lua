local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local set = require('utils').set

-- Color scheme
set('termguicolors', true)

-- Leader key
g.mapleader = [[ ]]
cmd([[colorscheme tokyonight]])

-- Settings
local buffer = { o, bo }
local window = { o, wo }

set('langmenu', 'zh_CN.UTF-8')
set('helplang', 'cn')
set('encoding', 'utf-8')
set('fileencoding', 'utf-8')
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
set('signcolumn', 'auto:1')

set('textwidth', 120, buffer)
set('smartindent', true, buffer)
set('autoindent', true, buffer)
set('cindent', true, buffer)
set('shiftwidth', 4, buffer)
set('softtabstop', 4, buffer)
set('tabstop', 4, buffer)

local init_lua_augroup = 'init_lua_augroup'
vim.api.nvim_create_augroup(init_lua_augroup, { clear = true })

-- highlight yanked text briefly
vim.api.nvim_create_autocmd('TextYankPost', {
    group = init_lua_augroup,
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 250,
            on_visual = true,
        })
    end,
})

-- reopen last position
vim.api.nvim_create_autocmd('BufReadPost', {
    group = init_lua_augroup,
    callback = function()
        local previous_pos = vim.api.nvim_buf_get_mark(0, '"')[1]
        local last_line = vim.api.nvim_buf_line_count(0)
        if previous_pos >= 1 and previous_pos <= last_line and vim.bo.filetype ~= 'commit' then
            vim.cmd('normal! g`"')
        end
    end,
})
