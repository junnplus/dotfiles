-- Color scheme
vim.o.termguicolors = true

-- Leader key
vim.g.mapleader = ' '

vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.fencs = 'utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936'
vim.o.hidden = true
vim.o.wildmenu = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.matchtime = 1
vim.o.showmatch = true
vim.o.updatetime = 100
vim.o.ignorecase = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.laststatus = 2
vim.o.showcmd = true
vim.o.ruler = true
vim.o.history = 300
vim.o.backup = false
vim.o.swapfile = false
vim.o.foldenable = false
vim.o.autoread = true
vim.o.autowrite = true
vim.o.mouse = 'a'

vim.o.number = true
vim.o.cursorline = true
vim.o.relativenumber = true
vim.o.cursorcolumn = true
vim.o.signcolumn = 'auto:1'
-- vim.o.cmdheight = 0
vim.opt.list = true
vim.opt.listchars:append('eol:↴')

vim.o.textwidth = 120
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.cindent = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

vim.api.nvim_create_augroup('Init', { clear = true })
-- highlight yanked text briefly
vim.api.nvim_create_autocmd('TextYankPost', {
    group = 'Init',
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
    group = 'Init',
    callback = function()
        local previous_pos = vim.api.nvim_buf_get_mark(0, '"')[1]
        local last_line = vim.api.nvim_buf_line_count(0)
        if previous_pos >= 1 and previous_pos <= last_line and vim.bo.filetype ~= 'commit' then
            vim.cmd('normal! g`"')
        end
    end,
})
