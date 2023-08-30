local Keys = require("spare.config.keymaps")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "v3.x",
    keys = function()
      return Keys.neotree
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("spare.plugins.tools.neotree")
    end,
  },
  {
    "numToStr/Comment.nvim",
    keys = function()
      return Keys.comment
    end,
    config = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = function()
      return Keys.telescope
    end,
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "octarect/telescope-menu.nvim",
    },
    config = function()
      require("spare.plugins.tools.telescope")
      require("telescope").load_extension("menu")
    end,
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup {
        filetypes = { "*" },
        user_default_options = {
          RGB = true,           -- #RGB hex codes
          RRGGBB = true,        -- #RRGGBB hex codes
          names = true,         -- "Name" codes like Blue or blue
          RRGGBBAA = false,     -- #RRGGBBAA hex codes
          AARRGGBB = false,     -- 0xAARRGGBB hex codes
          rgb_fn = false,       -- CSS rgb() and rgba() functions
          hsl_fn = false,       -- CSS hsl() and hsla() functions
          css = false,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = false,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes for `mode`: foreground, background,  virtualtext
          mode = "virtualtext", -- Set the display mode.
          -- Available methods are false / true / "normal" / "lsp" / "both"
          -- True is same as normal
          tailwind = false,                                -- Enable tailwind colors
          -- parsers can contain values used in |user_default_options|
          sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
          virtualtext = "■",
          -- update color values even if buffer is not focused
          -- example use: cmp_menu, cmp_docs
          always_update = true
        },
        -- all the sub-options of filetypes apply to buftypes
        buftypes = {},
      }
    end
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    version = "*",
    config = function()
      require("spare.plugins.tools.toggleterm")
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
      require("spare.plugins.tools.trouble")
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("spare.plugins.tools.todo-comments")
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
      require("spare.plugins.tools.markdown")
    end,
  },
  {
    "ziontee113/icon-picker.nvim",
    cmd = {
      "IconPickerInsert",
      "IconPickerYank",
      "IconPickerNormal",
    },
    dependencies = {
      "stevearc/dressing.nvim",
    },
    config = function()
      require("icon-picker").setup({
        disable_legacy_commands = true,
      })
    end,
  },
  {
    "folke/which-key.nvim",
    -- event = "VeryLazy",
    keys = function()
      return Keys.which_key
    end,
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        window = {
          border = "rounded",       -- none, single, double, shadow
          position = "buttom",      -- bottom, top
          margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
          padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
          winblend = 0,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
          zindex = 1000,            -- positive value to position WhichKey above other floating windows.
        },
        layout = {
          height = { min = 6, max = 6 },  -- min and max height of the columns
          width = { min = 20, max = 50 }, -- min and max width of the columns
          spacing = 3,                    -- spacing between columns
          align = "left",                 -- align columns left, center or right
        },
      })
    end,
  },
  {
    "folke/edgy.nvim",
    event = "WinNew",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    opts = {
      animate = {
        enabled = true,
        fps = 100, -- frames per second
        cps = 120, -- cells per second
        on_begin = function()
          vim.g.minianimate_disable = true
        end,
        on_end = function()
          vim.g.minianimate_disable = false
        end,
        -- Spinner for pinned views that are loading.
        -- if you have noice.nvim installed, you can use any spinner from it, like:
        -- spinner = require("noice.util.spinners").spinners.circleFull,
        spinner = {
          frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
          interval = 80,
        },
      },
      bottom = {
        -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
        {
          ft = "toggleterm",
          size = { height = 0.3 },
          -- exclude floating windows
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        {
          ft = "Trouble",
          title = " Lsp Quickfix",
        },
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 0.4 },
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
      },
      left = {
        -- {
        -- 	ft = "NvimTree",
        -- 	title = "NvimTree",
        -- 	open = "NvimTreeToggle",
        -- },
      },
    },
  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>utt', vim.cmd.UndotreeToggle)
    end
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    --[email protected] Flash.Config
    opts = {
      search = {
        mode = "fuzzy",
      },
      label = {
        rainbow = {
          enabled = true,
          shade = 5,
        }
      }
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
}
