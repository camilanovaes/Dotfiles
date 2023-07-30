-- Manager the neovim plugins

-- Install lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Basics
  'tpope/vim-commentary',
  'tpope/vim-sleuth',
  'windwp/nvim-autopairs',

  -- Git
  'tpope/vim-fugitive',
  'junegunn/gv.vim',
  'lewis6991/gitsigns.nvim',

  {
    -- LSP
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true, build = ":MasonUpdate" },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        'j-hui/fidget.nvim',
        tag = "legacy", -- pin to legacy branch until rewritten is finished
        event = "LspAttach",
        opts = {}
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      {
        'folke/neodev.nvim',
        opts = {}
      },
    },
  },

  -- Inject additional stuff into LSP diagnostics/actions
  'jose-elias-alvarez/null-ls.nvim',

  {
    -- Highlight, edit and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      'hrsh7th/cmp-buffer',
      'hrsh7th/nvim-cmp',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    },
  },
  {
    -- Finder
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-project.nvim',
    },
  },

  -- Visual
  { "catppuccin/nvim", name = "catppuccin" },
  'Mofiqul/dracula.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'nvim-lualine/lualine.nvim',

  -- Tests
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    }
  },
  {
    -- Debuging
    'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-telescope/telescope-dap.nvim',
    },
  },
  -- Copilot (testing)
  'github/copilot.vim',
}, {})
