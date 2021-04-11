-- vim: ts=2 sw=2 et:

local M = {}

function M.config()
  local compe = require('compe')
  compe.setup {
    enabled = true,
    autocomplete = true,
    min_length = 1,
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

  vim.g.loaded_compe_nvim_lsp = true
  require('compe_nvim_lsp').attach()

end

return M
