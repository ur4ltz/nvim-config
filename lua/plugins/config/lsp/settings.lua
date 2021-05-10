-- vim: ts=2 sw=2 et:

local api      = vim.api
local nvim_lsp = require('lspconfig')
local util     = require('lspconfig.util')

local custom_attach = function(client)
  -- test
  nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  nmap('gd', '<cmd>lua vim.lsp.buf.definitions()<cr>')
  nmap('K',  '<cmd>lua vim.lsp.buf.hover()<cr>')

  nmap('<Leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')
end

local function get_lua_runtime()
    local result = {}
    for _, path in pairs(api.nvim_list_runtime_paths()) do
        local lua_path = path .. "/lua/";
        if vim.fn.isdirectory(lua_path) then
            result[lua_path] = true
        end
    end
    result[vim.fn.expand("$VIMRUNTIME/lua")] = true
    return result;
end

local system_name = 'Linux'
local sumneko_root_path = vim.fn.expand('$HOME/github/lua-language-server')
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local servers = {
  bashls = {},
  cssls = {},
  gopls = {},
  html = {},
  jsonls = {},
  vimls = {},
  yamlls = {},

  sumneko_lua = {
    cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';')
        },
        diagnostics = {
          enable = true,
          globals = {'vim', 'use'},
        },
        workspace = {
          library = get_lua_runtime(),
          preloadFileSize = 1000
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },

  tsserver = {
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
  },
}

for server, config in pairs(servers) do
  config.on_attach = custom_attach
  nvim_lsp[server].setup(config)
end

