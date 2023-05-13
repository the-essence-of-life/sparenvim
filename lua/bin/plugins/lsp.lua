return {
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      {
        'onsails/lspkind.nvim',
        init = function()
          require('bin.plugins.lsp.lspkind')
        end
      },
    },
    config = function()
      require('bin.plugins.lsp.cmp')
    end
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    dependencies = {
      -- NOTE:LSP configurations.
      'neovim/nvim-lspconfig',
      'williamboman/mason-lspconfig.nvim',

      -- NOTE:Third-Party Plugins
      'jose-elias-alvarez/null-ls.nvim',
      "jay-babu/mason-nvim-dap.nvim",
      -- "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      require('bin.plugins.lsp.mason-c')
    end
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      "jay-babu/mason-null-ls.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('bin.plugins.lsp.null-ls')
      -- require('bin.plugins.lsp.mason-null-ls')
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      -- 'neovim/nvim-lspconfig',
    },
    config = function()
      require('bin.plugins.lsp.mason-null-ls')
      -- require("bin.plugins.lsp.mason-c") -- require your null-ls config here (example below)
      -- require("bin.plugins.lsp.null-ls") -- require your null-ls config here (example below)
    end,
  },
  {
    'mfussenegger/nvim-jdtls',
    ft = 'java',
    dependencies = 'neovim/nvim-lspconfig',
    config = function ()
      require('bin.plugins.lsp.jdtls')
    end
  },
  {
    'mfussenegger/nvim-dap',
    event = "VeryLazy",
    dependencies = {
      'rcarriga/nvim-dap-ui',
      {
        "jay-babu/mason-nvim-dap.nvim",
        config = true,
      },
    },
    config = function()
      require('bin.plugins.lsp.dap')
      require('bin.plugins.lsp.dapui')
    end
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    -- keys = function()
    --   require('bin.plugins.lsp.lspsaga-k')
    -- end,
    config = function()
      require('bin.plugins.lsp.lspsaga')
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
      { "neovim/nvim-lspconfig" },
    }
  },
  {
    'p00f/clangd_extensions.nvim',
    ft = 'c',
    dependencies = "neovim/nvim-lspconfig",
  },
  -- {
  --   'folke/neodev.nvim',
  --   ft = "lua",
  --   config = function()
  --     require('bin.plugins.lsp.neodev')
  --   end
  -- },
  {
    'neovim/nvim-lspconfig',
    event = "VeryLazy",
    config = function()
      require('bin.plugins.lsp.lspconfig')
    end,
  },
}
