-- vim: ts=2 sw=2 et:

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
  refactor = {
    highlight_current_scope = {enable = false},
    highlight_definitions   = {enable = true},
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename         = 'grr',
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition      = 'gnd',
        list_definitions     = 'gnD',
        list_definitions_toc = 'gO',
        goto_next_usage      = '<a-*>',
        goto_previous_usage  = '<a-#>',
      },
    },
  },
}
