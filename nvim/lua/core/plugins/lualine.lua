return {
  {
    'nvim-lualine/lualine.nvim',
    opts = function()
      local c = require('theme.palette').palette

      local theme = {
        normal = {
          a = { fg = c.black, bg = c.teal[30], gui = 'bold' },
          b = { fg = c.white, bg = c.black },
          c = { fg = c.white, bg = c.black },
        },
        insert = {
          a = { fg = c.black, bg = c.green[30], gui = 'bold' },
        },
        visual = {
          a = { fg = c.black, bg = c.magenta[50], gui = 'bold' },
        },
        replace = {
          a = { fg = c.black, bg = c.red[40], gui = 'bold' },
        },
        command = {
          a = { fg = c.black, bg = c.cyan[40], gui = 'bold' },
        },
        inactive = {
          a = { fg = c.black, bg = c.white },
          b = { fg = c.black, bg = c.white },
          c = { fg = c.black, bg = c.white },
        },
      }

      return {
        options = {
          theme = theme,

          -- these create the pill shapes
          -- section_separators = { right = '', left = '' },

          -- spacing between components
          component_separators = { left = ' ', right = ' ' },

          globalstatus = true,
        },

        sections = {
          lualine_a = {
            {
              'mode',
              padding = { left = 2, right = 2 },
            },
          },

          lualine_b = {
            {
              'branch',
              padding = { left = 1, right = 1 },
            },
          },

          lualine_c = {
            {
              'filename',
              padding = { left = 1, right = 1 },
            },
          },

          lualine_x = { 'encoding', 'filetype' },

          lualine_y = { 'progress' },

          lualine_z = {
            {
              'location',
              padding = { left = 1, right = 2 },
            },
          },
        },
      }
    end,
  },
}
