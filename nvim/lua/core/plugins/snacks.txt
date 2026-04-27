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
    },
  },
}
