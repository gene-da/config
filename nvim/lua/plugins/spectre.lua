return {
  {
    'nvim-pack/nvim-spectre',

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    config = function()
      local spectre = require 'spectre'

      spectre.setup {}

      vim.keymap.set('n', '<leader>Sr', function()
        spectre.open()
      end, { desc = 'Search: Replace (Spectre)' })

      vim.keymap.set('n', '<leader>Sw', function()
        spectre.open_visual { select_word = true }
      end, { desc = 'Search: Replace current word' })

      vim.keymap.set('v', '<leader>Sw', function()
        spectre.open_visual()
      end, { desc = 'Search: Replace selection' })

      vim.keymap.set('n', '<leader>Sp', function()
        spectre.open_file_search()
      end, { desc = 'Search: Replace in file' })
    end,
  },
}
