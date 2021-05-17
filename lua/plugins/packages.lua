-- vim: ts=2 sw=2 et:

return require('packer').startup(
  function()
    use {'wbthomason/packer.nvim'}

    use {
      disable = true,
      'gruvbox-community/gruvbox',
      config = function()
        vim.o.background            = "dark"
        vim.g.gruvbox_italics       = true
        vim.g.gruvbox_contrast_dark = "hard"
        vim.cmd [[colorscheme gruvbox]]
      end,
    }

    use {
      disable = true,
      'drewtempelmeyer/palenight.vim',
      config = function()
        vim.cmd [[colorscheme palenight]]
      end,
    }

    use {
      disable = true,
      'marko-cerovac/material.nvim',
      config = function()
        vim.g.material_style            = 'palenight'
        vim.g.material_italic_comments  = true
        vim.g.material_italic_keywords  = false
        vim.g.material_italic_functions = false
        vim.g.material_italic_variables = false
        vim.g.material_contrast         = true
        vim.g.material_borders          = true
        -- Load the colorscheme
        require('material').set()
      end,
    }

    use {
      -- disable = true,
      'folke/tokyonight.nvim',
      config = function()
        vim.g.tokyonight_style            = 'storm' -- 'storm', 'night'  or 'day'
        vim.g.tokyonight_italic_comments  = true
        vim.g.tokyonight_italic_keywords  = false
        vim.g.tokyonight_italic_functions = false
        vim.g.tokyonight_italic_variables = false
        vim.g.tokyonight_transparent      = false
        vim.g.tokyonight_sidebars         = {'qf', 'vista_kind', 'terminal', 'packer'}
        vim.cmd [[colorscheme tokyonight]]
      end,
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
        -- 'rafamadriz/friendly-snippets'
      },
      config = function()
        require('plugins.config.compe')
      end,
    }

    use {
      'folke/trouble.nvim',
      requires = {
        'nvim-web-devicons'
      },
      config = function()
        require('plugins.config.trouble')
      end,
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'nvim-treesitter/nvim-treesitter-refactor',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'p00f/nvim-ts-rainbow',
        -- 'polarmutex/contextprint.nvim',
        'theHamsta/nvim-treesitter-pairs',
        'nvim-treesitter/playground'
      },
      run = ':TSUpdate',
      config = function()
        require('plugins.config.treesitter')
      end,
    }

    use {
      'lukas-reineke/indent-blankline.nvim',
      branch = 'lua',
      setup = [[require('plugins.config.indentline')]]
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
      'sindrets/diffview.nvim',
      requires = {'nvim-web-devicons'},
      config = function()
        require('plugins.config.diffview')
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
        nmap('<F5>', ':MundoToggle<cr>')
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
      'terrortylor/nvim-comment',
      config = function()
        require('plugins.config.comment')
      end,
    }

    use {
      'famiu/nvim-reload'
    }

    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('plugins.config.colorizer')
      end,
    }

    use {'junegunn/vim-easy-align'}

    use {'mg979/vim-visual-multi'}

    use {'dstein64/nvim-scrollview'}

    use {
      'winston0410/range-highlight.nvim',
      config = function()
        require("range-highlight").setup{}
      end,
    }

  end
)

