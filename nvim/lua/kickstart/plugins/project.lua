return {
  {
    'ahmedkhalf/project.nvim',
    opts = {
      detection_methods = { 'pattern' },
      patterns = { '.git' },

      -- where project history is stored
      datapath = vim.fn.stdpath 'data',
    },
    config = function(_, opts)
      require('project_nvim').setup(opts)
      require('telescope').load_extension 'projects'
    end,
  },
}
