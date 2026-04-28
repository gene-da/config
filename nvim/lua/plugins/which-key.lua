return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      delay = 200,

      sort = { 'alphanum' },

      preset = 'helix',

      win = {
        border = 'rounded',
        padding = { 1, 2 },
        title_pos = 'center',
      },

      layout = {
        width = { max = 10 },
        spacing = 3,
      },

      spec = {
        { '<leader>s', group = 'Search' },
        { '<leader>t', group = 'Toggle' },
        { '<leader>g', group = 'Git' },
        { '<leader>c', group = 'Code' },
        { '<leader>r', group = 'Rename' },
        { '<leader>y', group = 'Yank' },
        { '<leader>f', group = 'Format' },
        { '<leader>S', group = 'Spectre' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
