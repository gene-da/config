return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    ft = 'markdown',

    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim',
    },

    opts = {
      workspaces = {
        {
          name = 'SME',
          path = '/mnt/c/Users/eugene.dann/Documents/SME/notes',
        },
      },

      new_notes_location = 'current_dir',

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },

      -- daily_notes = {
      --   folder = 'daily',
      --  date_format = '%Y-%m-%d',
      --   template = 'daily.md',
      -- },

      -- templates = {
      --   folder = 'templates',
      --   date_format = '%Y-%m-%d',
      --   time_format = '%H:%M',
      -- },

      mappings = {
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },

        ['<leader>oo'] = {
          action = '<cmd>ObsidianOpen<cr>',
          opts = { buffer = true },
        },

        ['<leader>on'] = {
          action = '<cmd>ObsidianNew<cr>',
          opts = { buffer = true },
        },

        ['<leader>ot'] = {
          action = '<cmd>ObsidianToday<cr>',
          opts = { buffer = true },
        },

        ['<leader>ob'] = {
          action = '<cmd>ObsidianBacklinks<cr>',
          opts = { buffer = true },
        },

        ['<leader>os'] = {
          action = '<cmd>ObsidianSearch<cr>',
          opts = { buffer = true },
        },
      },
    },
  },
}
