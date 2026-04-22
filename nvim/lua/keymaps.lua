vim.keymap.set('n', '<leader>rm', ':%s/\\r//g<CR>', { desc = 'Remove ^M characters' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to upper window' })

vim.keymap.set('n', '<leader>rq', '<CMD>qa!<CR>', { desc = 'Quit all current buffers without saving' })

vim.keymap.set('n', '<leader>yf', function()
  local file = vim.fn.expand '%:p'
  local git_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]

  if git_root and git_root ~= '' then
    file = file:gsub(git_root .. '/', '')
  end

  vim.fn.setreg('+', file)
end, { desc = 'Yank file path' })

vim.keymap.set('n', '<leader>yd', function()
  local file = vim.fn.expand '%:p'
  local git_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]

  local dir = file
  if git_root and git_root ~= '' then
    dir = file:gsub(git_root .. '/', '')
  end

  dir = vim.fn.fnamemodify(dir, ':h')
  vim.fn.setreg('+', dir)
end, { desc = 'Yank files path' })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
