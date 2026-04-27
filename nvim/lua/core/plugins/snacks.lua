return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,

    opts = {
      bigfile = { enabled = true },

      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },

          {
            icon = ' ',
            title = 'Recent Files',
            section = 'recent_files',
          },

          { section = 'startup' },
        },
      },

      notifier = {
        enabled = true,
        timeout = 3000,
      },

      indent = {
        enabled = true,
        animate = { enabled = true },
      },

      statuscolumn = { enabled = true },

      words = { enabled = false },

      picker = { enabled = true },
    },

    ------------------------------------------------
    -- KEYMAPS (same muscle memory as Telescope)
    ------------------------------------------------
    keys = {
      {
        '<leader>sf',
        function()
          Snacks.picker.files()
        end,
        desc = 'Files',
      },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Grep',
      },
      {
        '<leader>sw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = 'Word',
      },
      {
        '<leader>sb',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Buffers',
      },
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = 'Help',
      },
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = 'Keymaps',
      },
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = 'Diagnostics',
      },
      {
        '<leader>sr',
        function()
          Snacks.picker.resume()
        end,
        desc = 'Resume',
      },
      {
        '<leader>so',
        function()
          Snacks.picker.recent()
        end,
        desc = 'Recent Files',
      },
      {
        '<leader>sc',
        function()
          Snacks.picker.commands()
        end,
        desc = 'Commands',
      },

      -- Current buffer (dropdown style)
      {
        '<leader>/',
        function()
          Snacks.picker.lines {
            layout = { preset = 'dropdown' },
          }
        end,
        desc = 'Buffer',
      },

      -- Grep open files
      {
        '<leader>s/',
        function()
          Snacks.picker.grep {
            open = true,
          }
        end,
        desc = 'Open Files',
      },

      -- Neovim config
      {
        '<leader>sn',
        function()
          Snacks.picker.files {
            cwd = vim.fn.stdpath 'config',
          }
        end,
        desc = 'Neovim Config',
      },
    },
  },
}
