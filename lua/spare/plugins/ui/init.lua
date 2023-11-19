return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("spare.plugins.ui.index").catppuccin()
      local color = color or "catppuccin"
      vim.cmd.color(color)
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "UIEnter",
    keys = function()
    end,
    config = function()
      require("bufferline").setup({})
    end,
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "UIEnter",
  --   enabled = false,
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     vim.opt.laststatus = 2
  --     require("spare.plugins.ui.lualine")
  --   end,
  -- },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "UIEnter",
    config = function()
      require("spare.plugins.ui.index").ibl()
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local config = require("spare.plugins.ui.alpha").config
      require("alpha").setup(config)
    end,
  },
  -- {
  --   enabled = false,
  --   "rebelot/heirline.nvim",
  --   dependencies = {
  --     'rose-pine/neovim',
  --   },
  --   -- You can optionally lazy-load heirline on UiEnter
  --   -- to make sure all required plugins and colorschemes are loaded before setup
  --   -- event = "UiEnter",
  --   config = function()
  --     require("spare.plugins.ui.heirline")
  --   end
  -- },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = { theme = 'catppuccin' },
        extensions = { 'quickfix', "lazy" }
      })
      require('lualine').get_config()
    end
  },
  -- {
  --   'dstein64/nvim-scrollview',
  --   config = function()
  --     require('scrollview').setup({
  --       excluded_filetypes = {},
  --       current_only = true,
  --       base = 'buffer',
  --       column = 80,
  --       signs_on_startup = { 'all' },
  --       diagnostics_severities = { vim.diagnostic.severity.ERROR }
  --     })
  --   end
  -- },
}
