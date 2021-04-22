-- vim: ts=2 sw=2 et:
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
vim.cmd [[packadd packer.nvim]]

-- vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

--  use {
--    disable = true,
--    'gruvbox-community/gruvbox',
--    config = function()
--      vim.o.background = "dark"
--      vim.g.gruvbox_italics = true
--      vim.g.gruvbox_contrast_dark = "hard"
--      vim.cmd [[colorscheme gruvbox]]
--    end
--  }

  use {
    --disable = true,
    'drewtempelmeyer/palenight.vim',
--    config = function()
--      vim.cmd [[colorscheme palenight]]
--    end,
  }

  use {'kyazdani42/nvim-web-devicons'}

  use {
    'kyazdani42/nvim-tree.lua',
    --commit = 'c2f2c665',
    requires = {
      'nvim-web-devicons'
    },
    config = require('plugins.config.tree-config').setup()
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.config.lsp')
    end,
  }

  use {
    'hrsh7th/nvim-compe',
    requires = {
      'nvim-lspconfig',
      'hrsh7th/vim-vsnip',
      'rafamadriz/friendly-snippets'
    },
    config = function()
      require('plugins.config.compe')
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      {'nvim-treesitter/nvim-treesitter-refactor'},
      {'nvim-treesitter/nvim-treesitter-textobjects'},
      {'p00f/nvim-ts-rainbow'},
      {'bryall/contextprint.nvim'},
      {'theHamsta/nvim-treesitter-pairs'}
    },
    run = ':TSUpdate',
    config = function()
      require('plugins.config.treesitter')
    end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('plugins.config.gitsigns')
    end,
  }

  use {
    'famiu/feline.nvim',
    requires = {'nvim-web-devicons'},
    config = function()
      require('plugins.config.feline')
    end,
  }

  use {
    'mhinz/vim-startify',
    config = function()
      require('plugins.config.startify')
    end,
  }

  use {
    'simnalamburt/vim-mundo',
    config = function()
      vim.g.mundo_width          = 60
      vim.g.mundo_preview_bottom = true
    end,
  }

  use {'euclidianAce/BetterLua.vim'}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('plugins.config.telescope')
    end,
  }

  use {
    'famiu/nvim-reload'
  }

end, {git = {clone_timeout = 360}} )

