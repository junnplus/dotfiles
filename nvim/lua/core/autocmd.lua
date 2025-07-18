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

-- preformat json with jq
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
  pattern = '*.json',
  command = ':%!jq .'
})


vim.api.nvim_create_autocmd('FocusGained', {
  desc = 'Reload files from disk when we focus vim',
  pattern = '*',
  command = "if getcmdwintype() == '' | checktime | endif",
})

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Every time we enter an unmodified buffer, check if it changed on disk',
  pattern = '*',
  command = "if &buftype == '' && !&modified && expand('%') != '' | exec 'checktime ' . expand('<abuf>') | endif",
})
