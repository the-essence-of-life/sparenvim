-- do
return {
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("bin.plugins.lsp.lspsaga")
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason-lspconfig.nvim" },
      { "glepnir/lspsaga.nvim" },
      -- "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("bin.plugins.lsp.lsp-settings").mason()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "amarakon/nvim-cmp-buffer-lines",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lua",
      { 'romgrk/fzy-lua-native', build = 'make' },
      {
        'tzachar/cmp-fuzzy-path',
        dependencies = 'tzachar/fuzzy.nvim'
      },
    },
    config = function()
      require("bin.plugins.lsp.cmp")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      -- {
      -- 	"folke/neodev.nvim",
      -- 	config = true, --需要加上这个
      -- },
    },
    -- dependencies = {
    -- 	"williamboman/mason-lspconfig.nvim",
    -- },
    config = function()
      require("bin.plugins.lsp.lsp-settings").lspconfig_global()
      require("bin.plugins.lsp.lsp-settings").lsp_settings()
      require("bin.plugins.lsp.lsp-settings").lsp_server()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("bin.plugins.lsp.mason-lspconfig")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("bin.plugins.lsp.null-ls")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    'habamax/vim-asciidoctor',
    event = "BufEnter *.adoc",
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("bin.plugins.lsp.mason-null-ls") -- require your null-ls config here (example below)
    end,
  },
}
-- end

-- vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = true, buffer = 5 })
