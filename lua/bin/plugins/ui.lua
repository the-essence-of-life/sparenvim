return {
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   enabled = false,
  --   priority = 1000, -- Ensure it loads first
  --   config = function()
  --     vim.cmd("colorscheme onedark_vivid")
  --   end
  -- },
  -- {
  --   'shaunsingh/nord.nvim',
  --   priority = 1000,
  --   config = function ()
  --     vim.cmd[[colorscheme nord]]
  --   end
  -- },
  -- {
  --   'marko-cerovac/material.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd("colorscheme material")
  --     vim.g.material_style = "palenight"
  --   end
  -- },
  -- {
  --   'rmehri01/onenord.nvim',
  --   name = 'uc-onenord',
  --   lazy = false,
  --   priority = 1000,
  --   init = function()
  --     vim.cmd([[colorscheme onenord]])
  --   end
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        transparent_background = false,
        flavour = "frappe",
        term_colors = true,
        style = {
          no_italic = true,
        },
        integrations = {
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = {},
              hints = {},
              warnings = {},
              information = {},
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },
  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   config = true,
  --   event = { "WinNew" },
  -- },
  -- {
  --   'gelguy/wilder.nvim',
  --   cond = false,
  --   name = 'cmdline',
  --   dependencies = {
  --     'roxma/nvim-yarp',
  --     'roxma/vim-hug-neovim-rpc',
  --   },
  --   config = function ()
  --     require('bin.plugins.ui.wilder')
  --   end
  -- },
  -- {
  --   'romgrk/barbar.nvim',
  --   cond = false,
  --   event = "UIEnter",
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   init = function()
  --     vim.g.barbar_auto_setup = false
  --     vim.opt.mouse = 'a'
  --     local map = vim.api.nvim_set_keymap
  --     local opts = { noremap = true, silent = true }
  --
  --     -- Move to previous/next
  --     map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
  --     map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
  --   end,
  --   config = function()
  --     require('bin.plugins.ui.barbar')
  --   end,
  --   version = '^1.0.0', -- optional: only update when a new 1.x version is released
  -- },
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    keys = {
      { '<a-,>', '<cmd>bprevious<cr>', mode = 'n' },
    },
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = true,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      vim.opt.laststatus = 2
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
        }
      }
    end
  },
  -- {
  --   'rebelot/heirline.nvim',
  --   -- event = "UIEnter",
  --   config = function()
  --     require('bin.plugins.ui.heirline')
  --   end
  -- },
  -- {
  --   "neanias/everforest-nvim",
  --   init = function()
  --     require("everforest").setup({
  --       -- Your config here
  --       -- background = "hardness",
  --     })
  --     vim.cmd([[colorscheme everforest]])
  --   end,
  -- },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  --   config = function()
  --     require("bin.plugins.ui.lualine")
  --   end,
  -- },
  -- {
  --   'tamton-aquib/staline.nvim',
  --   config = function ()
  -- require('bin.plugins.ui.staline')
  --   end
  -- },
  -- {
  --   "akinsho/bufferline.nvim",
  --   cond = false,
  --   version = "v3.*",
  --   init = function()
  --     vim.keymap.set("n", "<c-h>", "<cmd>bprev<cr>")
  --     vim.keymap.set("n", "<c-l>", "<cmd>bnext<cr>")
  --   end,
  --   dependencies = "nvim-tree/nvim-web-devicons",
  --   config = true,
  -- },
  {
    "DaikyXendo/nvim-material-icon",
    event = "UIEnter",
    init = function()
      local web_devicons_ok, web_devicons = pcall(require, "nvim-web-devicons")
      if not web_devicons_ok then
        return
      end

      local material_icon_ok, material_icon = pcall(require, "nvim-material-icon")
      if not material_icon_ok then
        return
      end

      web_devicons.setup({
        override = material_icon.get_icons(),
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "UIEnter",
    config = function()
      require("bin.plugins.ui.indent-blankline")
    end,
  },
  -- {
  --   "shellRaining/hlchunk.nvim",
  --   event = { "UIEnter" },
  --   config = true,
  -- },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require("bin.plugins.ui.alpha")
    end,
  },
  -- {
  -- 	"glepnir/dashboard-nvim",
  -- 	event = "VimEnter",
  -- 	config = function()
  -- require("bin.plugins.ui.dashboard")
  -- 	end,
  -- 	dependencies = {
  -- 		{
  -- 			"nvim-tree/nvim-web-devicons",
  -- 		},
  -- 		{
  -- 			"glepnir/dbsession.nvim",
  -- 			cmd = {
  -- 				"SessionSave",
  -- 				"SessionDelete",
  -- 				"SessionLoad",
  -- 			},
  -- 		},
  -- 	},
  -- },
  -- {
  -- 'tamton-aquib/staline.nvim',
  -- config = function ()
  --   require('bin.plugins.ui.staline')
  -- end
  -- },
}
