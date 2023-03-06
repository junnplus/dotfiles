local cmd = vim.cmd
local ncmd = vim.api.nvim_command

ncmd('filetype plugin indent on')
cmd([[ autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120 ]])
cmd([[ autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120 ]])
cmd([[ autocmd FileType json,jsonnet setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]])
cmd([[ autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120 noexpandtab ]])
cmd([[ autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 ]])
cmd([[ autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 expandtab ]])
cmd([[ autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120 ]])
cmd([[ autocmd FileType less,sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120 ]])
cmd(
    [[ autocmd FileType javascript,javascript.jsx,javascriptreact,typescript,typescriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab ]]
)
cmd([[ autocmd FileType NvimTree setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 ]])

cmd([[ autocmd BufNewFile,BufRead *.proto setfiletype proto ]])
cmd([[ autocmd FileType proto setlocal shiftwidth=2 expandtab ]])
