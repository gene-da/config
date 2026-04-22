return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },

    opts = {
      lsp = {
        progress = { enabled = true },

        hover = { enabled = true },

        signature = { enabled = true },

        message = { enabled = true },
      },

      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },
}
