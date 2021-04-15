-- vim: ts=2 sw=2 et:

local api = vim.api
local nvim_lsp = require('lspconfig')

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
  vimls = {},
  gopls = {},
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
          library = get_lua_runtime()
        }
      }
    }
  },
}

for server, config in pairs(servers) do
  nvim_lsp[server].setup(config)
end
