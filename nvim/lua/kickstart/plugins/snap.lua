return {
  {
    'mistweaverco/snap.nvim',
    version = 'v1.5.0',
    cmd = 'Snap',
    event = 'VeryLazy',
    opts = {
      output_dir = '/mnt/c/Users/eugene.dann/Downloads',
      filename_pattern = '%file_name_%date',
      additional_template_data = {
        author = 'Gene',
        website = 'https://github.com/gene-da',
      },
      save_to_clipboard = {
        image = true,
        html = false,
      },
    },
    config = function(_, opts)
      require('snap').setup(opts)
      vim.keymap.set('v', '<leader>ss', '<cmd>Snap<cr>', { desc = 'Snap selection' })
      vim.keymap.set('n', '<leader>ss', '<cmd>Snap<cr>', { desc = 'Snap screen' })
    end,
  },
}
