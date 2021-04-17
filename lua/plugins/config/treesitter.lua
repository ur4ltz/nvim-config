-- vim: ts=2 sw=2 et:

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'all' -- 'maintained'
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
}
