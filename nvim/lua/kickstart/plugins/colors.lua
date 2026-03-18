return {
  {
    'Shatur/neovim-ayu',
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true

      -- choose Ayu variant
      vim.g.ayucolor = ''

      require('ayu').setup {
        mirage = true, -- ensures we use dark instead of mirage
        terminal = true,
      }

      require('ayu').colorscheme()
    end,
  },
}
