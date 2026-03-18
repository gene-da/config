return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      delay = 200,

      preset = 'modern',

      win = {
        border = 'rounded',
        padding = { 1, 2 },
      },

      layout = {
        width = { min = 20 },
        spacing = 3,
      },

      icons = {
        mappings = vim.g.have_nerd_font,

        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up>',
          Down = '<Down>',
          Left = '<Left>',
          Right = '<Right>',
          CR = '<CR>',
          Esc = '<Esc>',
          Space = '<Space>',
          Tab = '<Tab>',
        },
      },

      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>g', group = '[G]it' },
        { '<leader>c', group = '[C]ode' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
