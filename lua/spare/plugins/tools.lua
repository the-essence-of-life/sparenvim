local Index = require("spare.plugins.index.tools")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<a-e>", "<cmd>Neotree<cr>", mode = "n" }
    },
    version = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      Index.neotree()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<a-f>", "<cmd>Telescope find_files<cr>",   mode = { "n", "i" } },
      { "<a-r>", "<cmd>Telescope live_grep<cr>",    mode = { "n", "i" } },
      { "<a-g>", "<cmd>Telescope git_files<cr>",    mode = { "n", "i" } },
      { "<a-b>", "<cmd>Telescope git_branches<cr>", mode = { "n", "i" } },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = Index.telescope,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    keys = {
      { "gcc", mode = "n" },
      { "gc",  mode = "v" },
    },
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    version = "*",
    opts = Index.toggleterm
  },
  {
    "lewis6991/gitsigns.nvim",
    cond = function()
      return vim.fn.executable("git") == 1
    end,
    event = "BufReadPre",
    config = true,
  },

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<a-t>", "<cmd>Trouble<cr>" },
    },
    -- event = "LspAttach",
    opts = Index.trouble
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufRead", "BufReadPre" },
    dependencies = "nvim-lua/plenary.nvim",
    opts = Index.todo_commets
  },
  {
    "folke/which-key.nvim",
    keys = {
      { "<ctrl>",   mode = { "n", "i", "v" } },
      { "<alt>",    mode = { "n", "i", "v" } },
      { "<leader>", mode = { "n", "i", "v" } },
      { "<esc>",    mode = { "n", "i", "v" } },
    },
    -- event = "VeryLazy",
    config = function()
      Index.which_key()
    end,
  },
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<c-z>", "<cmd>ZenMode<cr>" }
    },
    config = function()
      require("zen-mode").setup()
      -- vim.api.nvim_create_autocmd("InsertEnter",{callback = function ()
      --   vim.cmd("ZenMode")
      -- end})
      -- vim.api.nvim_create_autocmd("InsertLeave",{callback = function ()
      --   vim.cmd("q")
      -- end})
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = "BufRead",
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end
  },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cond = function()
  --     return vim.fn.executable("npm") == 1
  --   end,
  --   -- event = "BufEnter *.md",
  --   keys = {
  --     { "<leader>mp", "<plug>MarkdownPreview", mode = "n", ft = 'markdown' }
  --   },
  --   -- ft = "md",
  --   -- ft = "markdown",
  --   build = "cd app && npm install",
  --   config = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  -- },
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
    ft = "markdown",
  },
  {
    "ixru/nvim-markdown",
    -- event = "BufEnter *.md",
    ft = "markdown",
    -- ft = "md",
    config = function()
      Index.markdown()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = 'BufRead',
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    'chentoast/marks.nvim',
    event = 'BufRead',
    config = function()
      require 'marks'.setup {
        default_mappings = true,
        bookmark_0 = {
          sign = '■',
          virt_text = "<- last place",
          annotate = false,
        },
        mappings = {}
      }
    end
  },
  { "sindrets/diffview.nvim" },
  {
    'stevearc/oil.nvim',
    opts = {
      columns = {
        "icon",
        "size",
      },
      view_options = {
        show_hidden = true,
        natural_order = false,
      },
    },
    keys = {
      { "-", '<cmd>Oil<cr>' }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
