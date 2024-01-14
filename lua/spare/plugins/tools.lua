local Index = require("spare.plugins.index.tools")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    import = "lazyflex.hook",
    opts = { enable_match = false, kw = { "lsp", "cmp" } },
    version = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      Index.neotree()
      vim.keymap.set("n", "<a-e>", "<cmd>Neotree<cr>")
    end,
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
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "octarect/telescope-menu.nvim",
    },
    config = function()
      Index.telescope()
      require("telescope").load_extension("menu")
    end,
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      Index.colorizer()
    end
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    version = "*",
    config = function()
      Index.toggleterm()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
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
    config = function()
      Index.trouble()
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufRead", "BufReadPre" },
    requires = "nvim-lua/plenary.nvim",
    config = function()
      Index.todo_commets()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    -- event = "BufEnter *.md",
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<cr>", mode = "n", ft = 'markdown' }
    },
    -- ft = "md",
    -- ft = "markdown",
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
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
  -- {
  --   "potamides/pantran.nvim",
  --   config = function()
  --     local pantran = require("pantran")
  --     local actions = require("pantran.ui.actions")
  --     local engines = require("pantran.engines")
  --     local async = require("pantran.async")
  --     pantran.setup({
  --       default_engine = "argos"
  --     })
  --     -- local function translate(sentence)
  --     --   -- Engine methods can throw errors (e.g., due to timeouts or other network
  --     --   -- errors), which is why we use pcall.
  --     --   local ok, translation = pcall(engines.argos.translate, sentence)
  --     --   if ok then
  --     --     print(translation.text)
  --     --   end
  --     -- end
  --
  --     async.run(translate, "Hello!") -- prints "Hello World!"
  --     local opts = { noremap = true, silent = true, expr = true }
  --     vim.keymap.set("n", "<leader>tr", pantran.motion_translate, opts)
  --     vim.keymap.set("n", "<leader>trr", function() return pantran.motion_translate() .. "_" end, opts)
  --     vim.keymap.set("x", "<leader>tr", pantran.motion_translate, opts)
  --   end
  -- },
  -- Lua
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
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end
  },
}
