local Index = require("spare.plugins.index.tools")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    import = "lazyflex.hook",
    opts = { enable_match = false, kw = { "lsp", "cmp" } },
    version = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",     -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      Index.neotree()
      vim.keymap.set("n", "<a-e>", "<cmd>Neotree<cr>")
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
    event = "InsertEnter",
    config = function()
      Index.colorizer()
    end
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
    -- cmd = "ToggleTerm",
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
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      Index.todo_commets()
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
    event = "StdinReadPost",
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end
  },
  {
    'stevearc/overseer.nvim',
    dependencies = {
      "akinsho/toggleterm.nvim",
    },
    opts = {
      strategy = {
        "toggleterm",
        quit_on_exit = "success",
      },
      templates = { "builtin", "user.webserver" }
    },
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
    'Pocco81/HighStr.nvim',
    config = function()
      local high_str = require("high-str")

      high_str.setup({
        verbosity = 0,
        saving_path = vim.fn.stdpath("data") .. "/highstr/",
        highlight_colors = {
          -- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
          -- color_0 = { "#0c0d0e", "smart" }, -- Cosmic charcoal
          color_1 = { "#C35966", "smart" },     -- Pastel yellow
          color_2 = { "#C38547", "smart" },     -- Aqua menthe
          color_3 = { "#B6C359", "smart" },     -- Proton purple
          color_4 = { "#85C347", "smart" },     -- Orange red
          color_5 = { "#599BC3", "smart" },     -- Office green
          color_6 = { "#35B1C3", "smart" },     -- Just blue
          color_7 = { "#8159C3", "smart" },     -- Blush pink
          color_8 = { "#857CC3", "smart" },     -- Cosmic latte
          color_9 = { "#8EB6C3", "smart" },     -- Fallow brown
        }
      })
      vim.api.nvim_set_keymap(
        "v",
        "<F1>",
        ":<c-u>HSHighlight 1<CR>",
        {
          noremap = true,
          silent = true
        }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<F2>",
        ":<c-u>HSHighlight 2<CR>",
        {
          noremap = true,
          silent = true
        }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<F3>",
        ":<c-u>HSHighlight 3<CR>",
        {
          noremap = true,
          silent = true
        }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<F4>",
        ":<c-u>HSHighlight 4<CR>",
        {
          noremap = true,
          silent = true
        }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<F5>",
        ":<c-u>HSHighlight 5<CR>",
        {
          noremap = true,
          silent = true
        }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<F6>",
        ":<c-u>HSHighlight 6<CR>",
        {
          noremap = true,
          silent = true
        }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<F7>",
        ":<c-u>HSHighlight 7<CR>",
        {
          noremap = true,
          silent = true
        }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<F8>",
        ":<c-u>HSHighlight 8<CR>",
        {
          noremap = true,
          silent = true
        }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<F9>",
        ":<c-u>HSHighlight 9<CR>",
        {
          noremap = true,
          silent = true
        }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<F9>",
        ":<c-u>HSRmHighlight<CR>",
        {
          noremap = true,
          silent = true
        }
      )
    end
  }
}
