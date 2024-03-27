vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- package manager
  use { 'wbthomason/packer.nvim' }

  -- search
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }
  use {
    'ThePrimeagen/refactoring.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
    },
  }

  --theme
  use { 'stevearc/dressing.nvim' } -- vim select/input ui styling
  use { 'ojroques/nvim-hardline' } -- statusline
  use { 'akinsho/bufferline.nvim', tag = '*', requires = 'nvim-tree/nvim-web-devicons' } -- bufferline
  use {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  }

  -- keybinding
  use 'folke/which-key.nvim'

  -- file explore
  use 'nvim-tree/nvim-tree.lua'

  -- lsp
  use {
    'williamboman/mason.nvim',
    requires = {
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'mfussenegger/nvim-dap' },
    },
  }

  use 'tpope/vim-commentary'

  use {
    'rcarriga/nvim-dap-ui',
    requires = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    },
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
  }

  -- ternimal
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
  }
end)
