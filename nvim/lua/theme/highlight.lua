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
    DiffAdd = { fg = c.white, bg = c.green[7] },
    DiffDelete = { fg = c.red[50], bg = c.black, bold = true },
    DiffText = { fg = c.white, bg = c.teal[6], bold = true },

    ColorColumn = { fg = c.white, bg = c.gray.warm[8] },
    Conceal = { fg = c.gray.base[10], bg = c.black, blend = 50 },

    CurSearch = { fg = c.black, bg = c.yellow[2], bold = true },

    Cursor = { fg = c.black, bg = c.gray.base[3] },
    lCursor = { fg = c.black, bg = c.gray.base[3] },
    CursorIM = { fg = c.black, bg = c.gray.base[3] },

    CusorColumn = { bg = c.gray.warm[9] }, -- typo intentional
    CursorLine = { bg = c.gray.warm[9] },

    EndOfBuffer = { fg = c.gray.base[8] },
    TermCursor = { fg = c.black, bg = c.gray.base[3] },
    ErrorMsg = { fg = c.red[5], bold = true },
    WinSeperator = { fg = c.white }, -- typo intentional

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

    WarningMsg = { fg = c.yellow[3] },
    -- WhiteSpace = {},
    -- WildMenu = {},
    -- WinBar = {},
    -- WinBarNC = {},
  },

  syntax = {
    String = { link = '@string' },
    Character = { link = '@string' },
    Number = { link = '@number' },
    Float = { link = '@number.float' },
    Boolean = { link = '@boolean' },
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
    Error = { link = '@comment.error' },
    -- Label = {},
    -- Special = {},
    -- SpecialChar = {},
    -- Function = {},
    -- Operator = {},
    -- Title = {},
    -- Tag = {},
    -- Delimiter = {},
    Comment = { link = '@comment' },
    SpecialComment = { link = '@comment.documentation' },
    Todo = { link = '@comment.todo' },
  },

  treesitter = {
    -- Attributes
    ['@attribute'] = {},
    ['@attribute.builtin'] = {},

    -- Literals
    ['@boolean'] = { fg = c.red[4], bold = true },
    ['@character'] = { fg = c.green[2], italic = true },
    ['@character.special'] = {},
    ['@number'] = { fg = c.yellow[2] },
    ['@number.float'] = { fg = c.yellow[2] },

    -- Comments
    ['@comment'] = { fg = c.gray.base[4] },
    ['@comment.documentation'] = { fg = c.gray.base[2] },
    ['@comment.error'] = { fg = c.red[3] },
    ['@comment.note'] = { fg = c.cyan[3] },
    ['@comment.todo'] = { fg = c.teal[3] },
    ['@comment.warning'] = { fg = c.yellow[2] },

    -- Constants
    ['@constant'] = {},
    ['@constant.builtin'] = {},
    ['@constant.macro'] = {},

    -- Constructors
    ['@constructor'] = {},

    -- Diff
    ['@diff.plus'] = { fg = c.green[3] },
    ['@diff.minus'] = { fg = c.red[5] },
    ['@diff.delta'] = { fg = c.blue[4] },

    -- Functions
    ['@function'] = { fg = c.teal[3] },
    ['@function.builtin'] = { link = '@function' },
    ['@function.call'] = { fg = c.teal[2], bold = true },
    ['@function.macro'] = { link = '@function' },
    ['@function.method'] = { link = '@function' },
    ['@function.method.call'] = { link = '@function.call' },

    -- Keywords
    ['@keyword'] = { fg = c.magenta[4], bold = true },
    ['@keyword.conditional'] = { link = '@keyword' },
    ['@keyword.conditional.ternary'] = { link = '@keyword' },
    ['@keyword.coroutine'] = { link = '@keyword' },
    ['@keyword.debug'] = { link = '@keyword' },
    ['@keyword.directive'] = { link = '@keyword' },
    ['@keyword.directive.define'] = { link = '@keyword' },
    ['@keyword.exception'] = { link = '@keyword' },
    ['@keyword.function'] = { link = '@keyword' },
    ['@keyword.import'] = { link = '@keyword' },
    ['@keyword.modifier'] = { link = '@keyword' },
    ['@keyword.operator'] = { link = '@keyword' },
    ['@keyword.repeat'] = { link = '@keyword' },
    ['@keyword.return'] = { link = '@keyword' },
    ['@keyword.type'] = { link = '@keyword' },

    -- Labels
    ['@label'] = {},

    -- Markup (markdown, etc.)
    ['@markup.strong'] = {},
    ['@markup.italic'] = {},
    ['@markup.strikethrough'] = {},
    ['@markup.underline'] = {},
    ['@markup.heading'] = {},
    ['@markup.heading.1'] = {},
    ['@markup.heading.2'] = {},
    ['@markup.heading.3'] = {},
    ['@markup.heading.4'] = {},
    ['@markup.heading.5'] = {},
    ['@markup.heading.6'] = {},
    ['@markup.link'] = {},
    ['@markup.link.label'] = {},
    ['@markup.link.url'] = {},
    ['@markup.list'] = {},
    ['@markup.list.checked'] = {},
    ['@markup.list.unchecked'] = {},
    ['@markup.math'] = {},
    ['@markup.quote'] = {},
    ['@markup.raw'] = {},
    ['@markup.raw.block'] = {},

    -- Modules / Namespaces
    ['@module'] = {},
    ['@module.builtin'] = {},

    -- Special
    ['@none'] = {},
    ['@conceal'] = {},

    -- Operators
    ['@operator'] = { fg = c.white },

    -- Properties / Fields
    ['@property'] = { fg = c.teal[3] },

    -- Punctuation
    ['@punctuation.bracket'] = {},
    ['@punctuation.delimiter'] = {},
    ['@punctuation.special'] = {},

    -- Strings
    ['@string'] = { fg = c.green[3], italic = true },
    ['@string.documentation'] = { link = '@string' },
    ['@string.escape'] = { link = '@string' },
    ['@string.regexp'] = { link = '@string' },
    ['@string.special'] = { link = '@string' },
    ['@string.special.path'] = { fg = c.green[2] },
    ['@string.special.symbol'] = { fg = c.green[2] },
    ['@string.special.url'] = { fg = c.green[2] },

    -- Tags (HTML/XML)
    ['@tag'] = {},
    ['@tag.builtin'] = {},
    ['@tag.attribute'] = {},
    ['@tag.delimiter'] = {},

    -- Types
    ['@type'] = { fg = c.purple[3] },
    ['@type.builtin'] = { fg = c.purple[4], bold = true },
    ['@type.definition'] = { fg = c.purple[4], bold = true },

    -- Variables
    ['@variable'] = {},
    ['@variable.builtin'] = {},
    ['@variable.member'] = {},
    ['@variable.parameter'] = {},
    ['@variable.parameter.builtin'] = {},
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
    TelescopeBorder = { fg = c.purple[3] },
    -- TelescopePromptNormal = {},
    -- TelescopePromptBorder = {},
    TelescopePromptTitle = { fg = c.purple[4] },
    TelescopePreviewTitle = { fg = c.purple[4] },
    TelescopeResultsTitle = { fg = c.purple[4] },
    -- TelescopeSelection = {},
    -- TelescopeSelectionCaret = {},
    TelescopeMatching = { fg = c.teal[3] },
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
