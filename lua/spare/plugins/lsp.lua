local Index = require("spare.plugins.index.lsp")

return {
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "williamboman/mason.nvim",
    -- cond = function()
    --   -- vim.notify("You can use :Mason to install the lsp server.", "Info")
    --   return true
    -- end,
    -- build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    dependencies = {
      { "neovim/nvim-lspconfig" },
      -- { "williamboman/mason-lspconfig.nvim" },
      { "glepnir/lspsaga.nvim" },
      "jose-elias-alvarez/null-ls.nvim",
      'stevearc/dressing.nvim',
    },
    config = function()
      Index.mason()
    end,
  },
  {
    "KadoBOT/cmp-plugins",
    config = function()
      require("cmp-plugins").setup({
        files = { ".*\\.lua" } -- default
        -- files = { "plugins.lua", "some_path/plugins/" } -- Recommended: use static filenames or partial paths
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- "neovim/nvim-lspconfig",
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
    config = function()
      Index.null_ls()
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "glepnir/lspsaga.nvim",
    -- event = "LspAttach",
    config = function()
      Index.lspsaga()
      -- index.lspsaga()
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  -- {
  --   'simrat39/rust-tools.nvim',
  --   ft = "rust",
  --   dependencies = {
  --     'neovim/nvim-lspconfig'
  --   },
  --   config = function()
  --     local rt = require("rust-tools")
  --
  --     rt.setup({
  --       server = {
  --         on_attach = function(_, bufnr)
  --           -- Hover actions
  --           vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
  --           -- Code action groups
  --           vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
  --         end,
  --       },
  --     })
  --   end
  -- },
}
