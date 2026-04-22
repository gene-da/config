return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },

    config = function(_, opts)
      require('gitsigns').setup(opts)

      local gs = require 'gitsigns'

      -- Actions
      vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { desc = 'Stage hunk' })
      vim.keymap.set('n', '<leader>gr', gs.reset_hunk, { desc = 'Reset hunk' })
      vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { desc = 'Preview hunk' })

      -- Bonus (you’ll end up using this)
      vim.keymap.set('n', '<leader>gb', gs.blame_line, { desc = 'Blame line' })
    end,
  },
}
