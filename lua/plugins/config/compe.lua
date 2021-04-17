-- vim: ts=2 sw=2 et:

--local M = {}

--function M.config()
  require('compe').setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
      path = true,
      buffer = true,
      calc = true,
      nvim_lsp = true,
      vsnip = true,
      zsh = true,
    },
  }
  -- vim.g.loaded_compe_nvim_lsp = true
  -- require('compe_nvim_lsp').attach()
--end

--return M
