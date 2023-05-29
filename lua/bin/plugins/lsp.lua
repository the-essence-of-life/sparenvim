return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    dependencies = {
      -- {"williamboman/mason-lspconfig.nvim", config = true},
      {"neovim/nvim-lspconfig", config = true},
      -- {"glepnir/lspsaga.nvim", config = true},
      -- "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require('bin.plugins.lsp.mason-lspconfig')
      require('bin.plugins.lsp.lsp')
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
    config = function()
      require('bin.plugins.lsp.cmp')
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require('bin.plugins.lsp.lsp')
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        preview = {
          lines_above = 0,
          lines_below = 10,
        },
        scroll_preview = {
          scroll_down = "<C-f>",
          scroll_up = "<C-b>",
        },
        request_timeout = 2000,
        ui = {
          -- This option only works in Neovim 0.9
          title = true,
          -- Border type can be single, double, rounded, solid, shadow.
          border = "single",
          winblend = 0,
          expand = "",
          collapse = "",
          code_action = "",
          incoming = " ",
          outgoing = " ",
          hover = ' ',
          kind = {},
        },
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  -- {
    --   "jose-elias-alvarez/null-ls.nvim",
    --   dependencies = {
      --     "jay-babu/mason-null-ls.nvim",
      --   },
      --   config = require('bin.plugins.lsp.null-ls')
      -- },
    }
