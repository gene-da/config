return {
  {
    'ahmedkhalf/project.nvim',
    opts = {
      detection_methods = { 'pattern', 'lsp' },
      patterns = { '.git', 'Makefile', 'package.json', 'pyproject.toml' },
      silent_chdir = true,
      datapath = vim.fn.stdpath 'data',
    },

    config = function(_, opts)
      require('project_nvim').setup(opts)
      require('telescope').load_extension 'projects'

      vim.keymap.set('n', '<leader>sp', require('telescope').extensions.projects.projects, {
        desc = 'Search for Projects',
      })
    end,
  },
}
