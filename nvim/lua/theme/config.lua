local c = require('theme.palette').palette

local s = vim.api.nvim_set_hl

-- Core UI
s(0, 'Normal', { fg = c.white, bg = c.black })
s(0, 'NormalFloat', { fg = c.white, bg = c.black })
s(0, 'CursorLine', { bg = c.gray[80] })
-- Treesitter
s(0, '@keyword', { bold = true })
s(0, '@comment', { italic = true })
s(0, '@type', { bold = true })
s(0, '@parameter', { italic = true })
s(0, '@variable', { bold = true })
