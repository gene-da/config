return {
  {
    'nvim-lualine/lualine.nvim',
    opts = function()
      local function hex(n)
        if not n then
          return nil
        end
        return string.format('#%06x', n)
      end

      local function hl(name)
        local h = vim.api.nvim_get_hl(0, { name = name })
        return {
          fg = hex(h.fg),
          bg = hex(h.bg),
        }
      end

      local normal = hl 'Normal'
      local comment = hl 'Comment'
      local blue = hl 'Function'
      local green = hl 'String'
      local magenta = hl 'Statement'
      local red = hl 'Error'
      local cyan = hl 'Special'

      local theme = {
        normal = {
          a = { fg = normal.bg, bg = blue.fg, gui = 'bold' },
          b = { fg = normal.fg, bg = normal.bg },
          c = { fg = normal.fg, bg = normal.bg },
        },
        insert = {
          a = { fg = normal.bg, bg = green.fg, gui = 'bold' },
        },
        visual = {
          a = { fg = normal.bg, bg = magenta.fg, gui = 'bold' },
        },
        replace = {
          a = { fg = normal.bg, bg = red.fg, gui = 'bold' },
        },
        command = {
          a = { fg = normal.bg, bg = cyan.fg, gui = 'bold' },
        },
        inactive = {
          a = { fg = comment.fg, bg = normal.bg },
          b = { fg = comment.fg, bg = normal.bg },
          c = { fg = comment.fg, bg = normal.bg },
        },
      }

      return {
        options = {
          theme = theme,

          -- these create the pill shapes
          --section_separators = { right = '', left = '' },

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
