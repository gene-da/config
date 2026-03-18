local root = function()
  local git = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  if git ~= nil and git ~= '' then
    return git
  end
  return vim.loop.cwd()
end
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>rm', ':%s/\\r//g<CR>', { desc = 'Remove ^M characters' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to upper window' })

vim.keymap.set('n', '<leader>rq', '<CMD>qa!<CR>', { desc = 'Quit: Nuke all current changes' })

vim.keymap.set('n', '<leader>yf', function()
  local file = vim.fn.expand '%:p'
  local git_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]

  if git_root and git_root ~= '' then
    file = file:gsub(git_root .. '/', '')
  end

  vim.fn.setreg('+', file)
end, { desc = '[Y]ank [F]ile path from git.' })

vim.keymap.set('n', '<leader>yd', function()
  local file = vim.fn.expand '%:p'
  local git_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]

  local dir = file
  if git_root and git_root ~= '' then
    dir = file:gsub(git_root .. '/', '')
  end

  dir = vim.fn.fnamemodify(dir, ':h')
  vim.fn.setreg('+', dir)
end, { desc = '[Y]ank [D]irectory of file from git.' })

vim.keymap.set('n', '<leader>pf', function()
  require('telescope.builtin').find_files {
    cwd = root(),
    hidden = true,
  }
end)

vim.keymap.set('n', '<leader>ps', function()
  require('telescope.builtin').live_grep {
    cwd = root(),
    additional_args = function()
      return { '--hidden' }
    end,
  }
end, { desc = 'Search project text' })

vim.keymap.set('n', '<leader>fs', function()
  require('telescope.builtin').lsp_document_symbols()
end, { desc = 'File symbols' })

vim.keymap.set('n', '<leader>ws', function()
  require('telescope.builtin').lsp_workspace_symbols()
end, { desc = 'Workspace symbols' })

vim.keymap.set('n', '<leader>fr', function()
  require('telescope.builtin').oldfiles()
end, { desc = 'Recent files' })

vim.keymap.set('n', '<leader>pp', '<cmd>Telescope projects<CR>', { desc = 'Projects' })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.keymap.set('n', '<leader>nh', '<cmd>Noice history<CR>', { desc = 'Message history' })
vim.keymap.set('n', '<leader>nl', '<cmd>Noice last<CR>', { desc = 'Last message' })
vim.keymap.set('n', '<leader>nd', '<cmd>Noice dismiss<CR>', { desc = 'Dismiss messages' })
