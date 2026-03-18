return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },

    config = function()
      local telescope = require 'telescope'
      local themes = require 'telescope.themes'

      telescope.setup {
        defaults = {

          sorting_strategy = 'ascending',

          prompt_prefix = '   ',
          selection_caret = ' ',

          entry_prefix = '  ',

          layout_strategy = 'horizontal',

          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.60,
              width = 0.92,
              height = 0.88,
            },
            vertical = {
              width = 0.90,
              height = 0.95,
              preview_height = 0.55,
            },
          },

          path_display = { 'smart' },

          winblend = 0,

          border = true,

          file_ignore_patterns = {
            '.git/',
            'node_modules',
            '%.lock',
            'dist/',
            'build/',
          },

          mappings = {
            i = {
              ['<C-j>'] = 'move_selection_next',
              ['<C-k>'] = 'move_selection_previous',
              ['<C-q>'] = 'send_to_qflist',
            },
          },
        },
        pickers = {

          find_files = {
            theme = 'dropdown',
            previewer = false,
          },

          buffers = {
            theme = 'dropdown',
            previewer = false,
            initial_mode = 'normal',
          },
        },

        extensions = {
          ['ui-select'] = {
            themes.get_dropdown {},
          },
        },
      }

      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'

      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      vim.keymap.set('n', '<leader>sc', function()
        builtin.find_files { cwd = vim.fn.expand '~/.config', hidden = true }
      end, { desc = '[S]earch ~/.config files' })
    end,
  },
}
