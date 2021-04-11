-- vim: ts=2 sw=2 et:
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  -- use {'kyazdani42/nvim-web-devicons'}

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('plugins.config.tree-config').setup()
    end,
  }

  use {
    'hrsh7th/nvim-compe',
    requires = {
      'hrsh7th/vim-vsnip',
    },
    config = require('plugins.config.compe').config,
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.config.lsp')
    end,
  }

  use {
    'mhinz/vim-startify',
    config = function()
      require('plugins.config.startify')
    end,
  }
end)

