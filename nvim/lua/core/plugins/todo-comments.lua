return {
  {
    'folke/todo-comments.nvim',
    event = { 'BufReadPost', 'BufNewFile' }, -- real event, not imaginary
    dependencies = { 'nvim-lua/plenary.nvim' },

    opts = {
      signs = true,
      keywords = {
        FIX = { icon = ' ', color = 'error' },
        TODO = { icon = ' ', color = 'info' },
        HACK = { icon = ' ', color = 'warning' },
        WARN = { icon = ' ', color = 'warning' },
        PERF = { icon = ' ', color = 'hint' },
        NOTE = { icon = '󰎞 ', color = 'hint' },
        TEST = { icon = '⏲ ', color = 'test' },
      },
    },

    keys = {
      {
        ']t',
        function()
          require('todo-comments').jump_next()
        end,
        desc = 'Next Todo',
      },
      {
        '[t',
        function()
          require('todo-comments').jump_prev()
        end,
        desc = 'Prev Todo',
      },

      -- Telescope (only works if telescope is installed)
      {
        '<leader>tt',
        function()
          local ok = pcall(require, 'telescope')
          if ok then
            vim.cmd 'TodoTelescope'
          else
            vim.notify('Telescope not installed', vim.log.levels.WARN)
          end
        end,
        desc = 'Todos (Telescope)',
      },

      {
        '<leader>tT',
        function()
          local ok = pcall(require, 'telescope')
          if ok then
            vim.cmd 'TodoTelescope keywords=TODO,FIX,FIXME'
          else
            vim.notify('Telescope not installed', vim.log.levels.WARN)
          end
        end,
        desc = 'Todos Priority',
      },

      -- Trouble (only works if trouble is installed)
      {
        '<leader>tl',
        function()
          local ok = pcall(require, 'trouble')
          if ok then
            vim.cmd 'Trouble todo toggle'
          else
            vim.notify('Trouble not installed', vim.log.levels.WARN)
          end
        end,
        desc = 'Todos (List)',
      },

      {
        '<leader>tL',
        function()
          local ok = pcall(require, 'trouble')
          if ok then
            vim.cmd 'Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}'
          else
            vim.notify('Trouble not installed', vim.log.levels.WARN)
          end
        end,
        desc = 'Todos Priority List',
      },
    },
  },
}
