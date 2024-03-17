local Index = require("spare.plugins.index.lsp")

return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = "LspAttach",
  },
  {
    "williamboman/mason.nvim",
    event = { "BufRead", "BufAdd", "BufNewFile" },
    cond = function ()
      return vim.fn.executable("npm") == 1
    end,
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    dependencies = "neovim/nvim-lspconfig",
    opts = Index.mason
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "rafamadriz/friendly-snippets",
      -- "KadoBOT/cmp-plugins",
      -- "chrisgrieser/cmp-nerdfont",
    },
    config = function()
      Index.competition()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "LspAttach",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      Index.lspconfig_global()
      Index.lsp_settings()
      Index.lsp_server()
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "LspAttach",
    config = function()
      Index.null_ls()
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = Index.lspsaga,
  },
}
