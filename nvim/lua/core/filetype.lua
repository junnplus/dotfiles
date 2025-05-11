vim.api.nvim_command('filetype plugin indent on')

local function augroup(name)
  return vim.api.nvim_create_augroup('augroup_' .. name, { clear = true })
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  group = augroup('python'),
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  group = augroup('lua'),
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  group = augroup('go'),
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'json', 'jsonnet' },
  group = augroup('json'),
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'yaml', 'yml' },
  group = augroup('yaml'),
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.textwidth = 0
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'css', 'scss', 'less' },
  group = augroup('css'),
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'html', 'htmldjango', 'xhtml', 'haml' },
  group = augroup('html'),
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.textwidth = 0
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'javascript', 'javascript.jsx', 'javascriptreact', 'typescript', 'typescriptreact' },
  group = augroup('js'),
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.textwidth = 0
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'NvimTree',
  group = augroup('nvimtree'),
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.textwidth = 0
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'proto',
  group = augroup('proto'),
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.textwidth = 0
  end,
})
