-- vim: ts=2 sw=2 et:

local g = vim.g

g.indentLine_char = '│'
g.indentLine_faster = 1
g.indentLine_fileTypeExclude = {
  'NvimTree',
  'help',
  'markdown',
  'packer',
  'startify',
  'tex',
  'txt',
}
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_space_char_blankline = ' '
g.indent_blankline_use_treesitter = true
