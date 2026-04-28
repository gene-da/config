local colors = require('colors.palette').colors.palette

local highlights = {
  common = {
    Normal = { fg = colors.white, bg = colors.black },
    NormalFloat = { fg = colors.white, bg = colors.black },
    FloatBorder = { fg = colors.purple[4], bg = colors.black },
    FloatTitle = { fg = colors.purple[4], bg = colors.black, bold = true },
    FloatFooter = { fg = colors.purple[4], bg = colors.black, bold = true },
    NormalNC = { fg = colors.white, bg = colors.black },

    Directory = { fg = colors.cyan[4], bg = colors.black },
    DiffAdd = { fg = colors.white, bg = colors.green[7] },
    DiffDelete = { fg = colors.red[50], bg = colors.black, bold = true },
    DiffText = { fg = colors.white, bg = colors.teal[6], bold = true },

    ColorColumn = { fg = colors.white, bg = colors.gray.warm[8] },
    Conceal = { fg = colors.gray.base[10], bg = colors.black, blend = 50 },

    CurSearch = { fg = colors.black, bg = colors.yellow[2], bold = true },

    Cursor = { fg = colors.black, bg = colors.gray.base[3] },
    lCursor = { fg = colors.black, bg = colors.gray.base[3] },
    CursorIM = { fg = colors.black, bg = colors.gray.base[3] },

    CusorColumn = { bg = colors.gray.warm[9] }, -- typo intentional
    CursorLine = { bg = colors.gray.warm[9] },

    EndOfBuffer = { fg = colors.gray.base[8] },
    TermCursor = { fg = colors.black, bg = colors.gray.base[3] },
    ErrorMsg = { fg = colors.red[5], bold = true },
    WinSeperator = { fg = colors.white }, -- typo intentional

    Folded = { fg = colors.gray.base[4] },
    FoldColumn = { fg = colors.gray.base[7] },
    SignColumn = { fg = colors.gray.base[7] },

    IncSearch = { fg = colors.black, bg = colors.yellow[2], bold = true },
    Substitute = { fg = colors.black, bg = colors.yellow[4] },

    LineNr = { fg = colors.gray.base[7] },
    LineNrAbove = { fg = colors.gray.base[7] },
    LineNrBelow = { fg = colors.gray.base[7] },

    CusorLineNr = { fg = colors.white },
    CursorLineFold = { fg = colors.gray.base[7] },
    CursorLineSign = { fg = colors.gray.base[7] },

    -- MatchParen = {},
    -- ModeMsg = {},
    -- MsgSeparator = {},
    -- MoreMsg = {},
    -- NonText = {},

    -- Pmenu = {},
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
    -- Question = {},
    -- QuickFixLine = {},

    -- Search = {},

    -- SnippetTabStop = {},
    -- SpecialKey = {},
    -- SpellBad = {},
    -- SpellCap = {},
    -- SpellLocal = {},
    -- SpellRare = {},

    -- StatusLine = {},
    -- StatusLineNC = {},
    -- StatusLineTerm = {},
    -- StatusLineTermNC = {},

    -- TabLine = {},
    -- TabLineSel = {},
    -- Title = {},

    -- Visual = {},
    -- VisualNOS = {},

    WarningMsg = { fg = colors.yellow[3] },
    -- WhiteSpace = {},
    -- WildMenu = {},
    -- WinBar = {},
    -- WinBarNC = {},
  },

  syntax = {
    String = { fg = colors.green[3], italic = true },
    -- Character = {},
    -- Number = {},
    -- Float = {},
    -- Boolean = {},
    -- Type = {},
    -- Structure = {},
    -- StorageClass = {},
    -- Identifier = {},
    -- Constant = {},
    -- PreProc = {},
    -- PreCondit = {},
    -- Include = {},
    -- Keyword = {},
    -- Define = {},
    -- Typedef = {},
    -- Exception = {},
    -- Conditional = {},
    -- Repeat = {},
    -- Statement = {},
    -- Macro = {},
    -- Error = {},
    -- Label = {},
    -- Special = {},
    -- SpecialChar = {},
    -- Function = {},
    -- Operator = {},
    -- Title = {},
    -- Tag = {},
    -- Delimiter = {},
    -- Comment = {},
    -- SpecialComment = {},
    -- Todo = {},
  },

  treesitter = {
    -- ['@attribute'] = {},
    -- ['@attribute.builtin'] = {},

    -- ['@boolean'] = {},
    -- ['@character'] = {},
    -- ['@character.special'] = {},
    -- ['@number'] = {},
    -- ['@number.float'] = {},

    -- ['@comment'] = {},
    -- ['@comment.documentation'] = {},
    -- ['@comment.error'] = {},
    -- ['@comment.note'] = {},
    -- ['@comment.todo'] = {},
    -- ['@comment.warning'] = {},

    -- ['@constant'] = {},
    -- ['@constant.builtin'] = {},
    -- ['@constant.macro'] = {},

    -- ['@constructor'] = {},

    -- ['@diff.plus'] = {},
    -- ['@diff.minus'] = {},
    -- ['@diff.delta'] = {},

    ['@function'] = { fg = colors.blue[4] },
    -- ['@function.builtin'] = {},
    -- ['@function.call'] = {},
    -- ['@function.macro'] = {},
    -- ['@function.method'] = {},
    -- ['@function.method.call'] = {},

    -- ['@keyword'] = {},
    -- ['@keyword.conditional'] = {},
    -- ['@keyword.conditional.ternary'] = {},
    -- ['@keyword.coroutine'] = {},
    -- ['@keyword.debug'] = {},
    -- ['@keyword.directive'] = {},
    -- ['@keyword.directive.define'] = {},
    -- ['@keyword.exception'] = {},
    -- ['@keyword.function'] = {},
    -- ['@keyword.import'] = {},
    -- ['@keyword.modifier'] = {},
    -- ['@keyword.operator'] = {},
    -- ['@keyword.repeat'] = {},
    -- ['@keyword.return'] = {},
    -- ['@keyword.type'] = {},

    -- ['@label'] = {},

    -- ['@markup.strong'] = {},
    -- ['@markup.italic'] = {},
    -- ['@markup.strikethrough'] = {},
    -- ['@markup.underline'] = {},
    -- ['@markup.heading'] = {},
    -- ['@markup.heading.1'] = {},
    -- ['@markup.heading.2'] = {},
    -- ['@markup.heading.3'] = {},
    -- ['@markup.heading.4'] = {},
    -- ['@markup.heading.5'] = {},
    -- ['@markup.heading.6'] = {},
    -- ['@markup.link'] = {},
    -- ['@markup.link.label'] = {},
    -- ['@markup.link.url'] = {},
    -- ['@markup.list'] = {},
    -- ['@markup.list.checked'] = {},
    -- ['@markup.list.unchecked'] = {},
    -- ['@markup.math'] = {},
    -- ['@markup.quote'] = {},
    -- ['@markup.raw'] = {},
    -- ['@markup.raw.block'] = {},

    -- ['@module'] = {},
    -- ['@module.builtin'] = {},

    -- ['@none'] = {},
    -- ['@conceal'] = {},

    -- ['@operator'] = {},

    -- ['@property'] = {},

    -- ['@punctuation.bracket'] = {},
    -- ['@punctuation.delimiter'] = {},
    -- ['@punctuation.special'] = {},

    -- ['@string'] = {},
    -- ['@string.documentation'] = {},
    -- ['@string.escape'] = {},
    -- ['@string.regexp'] = {},
    -- ['@string.special'] = {},
    -- ['@string.special.path'] = {},
    -- ['@string.special.symbol'] = {},
    -- ['@string.special.url'] = {},

    -- ['@tag'] = {},
    -- ['@tag.builtin'] = {},
    -- ['@tag.attribute'] = {},
    -- ['@tag.delimiter'] = {},

    -- ['@type'] = {},
    -- ['@type.builtin'] = {},
    -- ['@type.definition'] = {},

    -- ['@variable'] = {},
    -- ['@variable.builtin'] = {},
    -- ['@variable.member'] = {},
    -- ['@variable.parameter'] = {},
    -- ['@variable.parameter.builtin'] = {},
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

  telescope = {
    -- TelescopeNormal = {},
    TelescopeBorder = { fg = colors.purple[3] },
    -- TelescopePromptNormal = {},
    -- TelescopePromptBorder = {},
    TelescopePromptTitle = { fg = colors.purple[4] },
    TelescopePreviewTitle = { fg = colors.purple[4] },
    TelescopeResultsTitle = { fg = colors.purple[4] },
    -- TelescopeSelection = {},
    -- TelescopeSelectionCaret = {},
    TelescopeMatching = { fg = colors.teal[3] },
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
