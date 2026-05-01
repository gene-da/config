local c = require('theme.palette').colors.palette

local highlights = {
  common = {
    Normal = { fg = c.white, bg = c.black },
    NormalFloat = { fg = c.white, bg = c.black },
    FloatBorder = { fg = c.purple[4], bg = c.black },
    FloatTitle = { fg = c.purple[4], bg = c.black, bold = true },
    FloatFooter = { fg = c.purple[4], bg = c.black, bold = true },
    NormalNC = { fg = c.white, bg = c.black },

    Directory = { fg = c.cyan[4], bg = c.black },
    DiffAdd = { fg = c.white, bg = c.green[5] },
    DiffDelete = { fg = c.red[50], bg = c.black, bold = true },
    DiffText = { fg = c.white, bg = c.teal[6], bold = true },
    DiffChange = { fg = c.white, bg = c.green[6] },

    ColorColumn = { fg = c.white, bg = c.gray.warm[8] },
    Conceal = { fg = c.gray.base[10], bg = c.black, blend = 50 },

    CurSearch = { fg = c.black, bg = c.yellow[2], bold = true },

    Cursor = { fg = c.black, bg = c.gray.base[3] },
    lCursor = { fg = c.black, bg = c.gray.base[3] },
    CursorIM = { fg = c.black, bg = c.gray.base[3] },

    CursorColumn = { bg = c.gray.warm[9] },
    CursorLine = { bg = c.gray.warm[9] },

    EndOfBuffer = { fg = c.gray.base[8] },
    TermCursor = { fg = c.black, bg = c.gray.base[3] },
    ErrorMsg = { fg = c.red[5], bold = true },

    Folded = { fg = c.gray.base[4] },
    FoldColumn = { fg = c.gray.base[7] },
    SignColumn = { fg = c.gray.base[7] },

    IncSearch = { fg = c.black, bg = c.yellow[2], bold = true },
    Substitute = { fg = c.black, bg = c.yellow[4] },

    LineNr = { fg = c.gray.base[7] },
    LineNrAbove = { fg = c.gray.base[7] },
    LineNrBelow = { fg = c.gray.base[7] },

    CusorLineNr = { fg = c.white },
    CursorLineFold = { fg = c.gray.base[7] },
    CursorLineSign = { fg = c.gray.base[7] },

    -- MatchParen = {},
    ModeMsg = { fg = c.green[2] },
    -- MsgSeparator = {},
    MoreMsg = { fg = c.cyan[3] },
    NonText = { fg = c.gray.base[8] },

    Pmenu = { bg = c.gray.base[8] },
    -- PmenuSel = {},
    -- PmenuKind = {},
    -- PmenuKindSel = {},
    -- PmenuExtra = {},
    -- PmenuExtraSel = {},
    -- PmenuSbar = {},
    -- PmenuThumb = {},
    -- PmenuMatch = {},
    -- PmenuMatchSel = {},

    -- ComplMatchSel = {},
    Question = { fg = c.magenta[3] },
    QuickFixLine = { fg = c.teal[2] },

    Search = { fg = c.black, bg = c.yellow[4] },

    -- SnippetTabStop = {},
    -- SpecialKey = {},
    SpellBad = { sp = c.red[3] },
    SpellCap = { sp = c.yellow[2] },
    SpellLocal = { sp = c.green[2] },
    SpellRare = { sp = c.cyan[3] },

    StatusLine = {},
    StatusLineNC = {},
    StatusLineTerm = {},
    StatusLineTermNC = {},

    -- TabLine = {},
    -- TabLineSel = {},
    Title = { fg = c.purple[3] },

    Visual = { bg = c.gray.base[8] },
    -- VisualNOS = {},

    WarningMsg = { fg = c.yellow[3] },
    -- WhiteSpace = {},
    -- WildMenu = {},
    WinBar = { fg = c.gray.base[8], bg = c.black },
    WinBarNC = { fg = c.gray.base[8], bg = c.black },
    WinSeperator = { fg = c.purple[4] },
    OkMsg = { fg = c.green[2] },
  },

  syntax = {
    Statement = { fg = c.white },
    Constant = { fg = c.white },
    Number = { fg = c.teal[3] },
    Boolean = { fg = c.purple[4], bold = true },
    Keyword = { fg = c.magenta[4], bold = true },
    PreProc = { fg = c.blue[4], bold = true },
    Type = { fg = c.magenta[4], bold = true },
    Special = { fg = c.blue4 },
    Comment = { fg = c.gray.base[5], italic = true },
    String = { fg = c.green[2], italic = true },
    ['@variable'] = { fg = c.white },
    Identifier = { fg = c.cyan[2] },
    Function = { fg = c.cyan[4] },
    Operator = { fg = c.white },
    Delimiter = { fg = c.white },
    Todo = { fg = c.white },
  },
  python = {
    pythonStatement = { fg = c.magenta[4], bold = true },
    pythonClass = { fg = c.teal[3] },
  },

  lsp = {
    ['@lsp.type.comment'] = { link = '@comment' },
    ['@lsp.type.enum'] = { link = '@type' },
    ['@lsp.type.enumMember'] = { link = '@constant.builtin' },
    ['@lsp.type.interface'] = { link = '@type' },
    ['@lsp.type.typeParameter'] = { link = '@type' },
    ['@lsp.type.keyword'] = { link = '@keyword' },
    ['@lsp.type.namespace'] = { link = '@module' },
    ['@lsp.type.parameter'] = { link = '@variable.parameter' },
    ['@lsp.type.property'] = { link = '@property' },
    ['@lsp.type.variable'] = { link = '@variable' },
    ['@lsp.type.macro'] = { link = '@function.macro' },
    ['@lsp.type.method'] = { link = '@function.method' },
    ['@lsp.type.number'] = { link = '@number' },
    ['@lsp.type.generic'] = { link = '@text' }, -- still not defined btw
    ['@lsp.type.builtinType'] = { link = '@type.builtin' },
  },

  whichkey = {
    -- WhichKey = {},
    -- WhichKeyDesc = {},
    -- WhichKeyGroup = {},
    -- WhichKeySeparator = {},
  },

  gitsigns = {
    -- GitSignsAdd = {},
    -- GitSignsAddLn = {},
    -- GitSignsAddNr = {},
    -- GitSignsChange = {},
    -- GitSignsChangeLn = {},
    -- GitSignsChangeNr = {},
    -- GitSignsDelete = {},
    -- GitSignsDeleteLn = {},
    -- GitSignsDeleteNr = {},
  },

  snacks = {
    -- SnacksDashboardHeader = {},
    -- SnacksDashboardFooter = {},
    -- SnacksDashboardSpecial = {},
    -- SnacksDashboardDesc = {},
    -- SnacksDashboardIcon = {},
    -- SnacksDashboardKey = {},

    -- SnacksPicker = {},
    -- SnacksPickerBorder = {},
    -- SnacksPickerTitle = {},
    -- SnacksPickerMatch = {},
  },
}

for _, group_set in pairs(highlights) do
  for group, opts in pairs(group_set) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end
