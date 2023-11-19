return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "v3.x",
    -- keys = function ()
    --   vim.keymap.set("n", "<ctrl>e", "<cmd>Neotree<cr>")
    -- end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("spare.plugins.tools.index").neotree()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "octarect/telescope-menu.nvim",
    },
    config = function()
      require("spare.plugins.tools.index").telescope()
      require("telescope").load_extension("menu")
    end,
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require("spare.plugins.tools.index").colorizer()
    end
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    version = "*",
    config = function()
      require("spare.plugins.tools.index").toggleterm()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "UIEnter",
    config = true,
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("spare.plugins.tools.index").trouble()
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("spare.plugins.tools.index").todo_commets()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    event = "BufEnter *.md",
    -- ft = "md",
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
  {
    "ixru/nvim-markdown",
    event = "BufEnter *.md",
    -- ft = "md",
    config = function()
      require("spare.plugins.tools.index").markdown()
    end,
  },
  {
    "folke/which-key.nvim",
    -- event = "VeryLazy",
    config = function()
      require("spare.plugins.tools.index").which_key()
    end,
  },
}
