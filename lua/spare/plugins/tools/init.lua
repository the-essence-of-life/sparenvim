return {
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   lazy = false,
  --   keys = function()
  --     -- return {
  --     -- 	{ "<leader>nt", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
  --     -- }
  --     return require("spare.config.keymaps").tree
  --   end,
  --   config = function()
  --     require("spare.plugins.tools.nvim-tree")
  --   end,
  -- },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "jacobsimpson/nvim-mercurial",
    },
    event = "VeryLazy",
    config = function()
      require("diffview").setup({
        file_panel = {
          win_config = {
            width = 20,
          },
        },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "v3.x",
    keys = function()
      return require("spare.config.keymaps").neotree
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
    "terryma/vim-multiple-cursors",
  },
  {
    "numToStr/Comment.nvim",
    keys = function()
      return require("spare.config.keymaps").comment
    end,
    config = true,
  },
  {
    "tanvirtin/vgit.nvim",
    enabled = false,
    cmd = {
      "VGit setup",
      "VGit toggle_diff_preference",
      "VGit toggle_live_gutter",
      "VGit toggle_live_blame",
      "VGit toggle_authorship_code_lens",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.o.updatetime = 300
      vim.o.incsearch = false
      vim.wo.signcolumn = "yes"
      require("spare.plugins.tools.vgit")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    -- keys = {
    -- 	{ "m", "<cmd>Telescope menu<cr>", mode = "n" },
    -- 	{ "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n" },
    -- 	{ "<leader>fg", "<cmd>Telescope current_buffer_fuzzy_find<cr>", mode = "n" },
    -- },
    -- tag = "0.1.1",
    keys = function()
      return require("spare.config.keymaps").telescope
    end,
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "octarect/telescope-menu.nvim",
      -- "nvim-telescope/telescope-file-browser.nvim",
      -- "debugloop/telescope-undo.nvim",
      -- "LinArcX/telescope-command-palette.nvim",
      -- "tsakirist/telescope-lazy.nvim",
      -- {
      --   "nvim-telescope/telescope-frecency.nvim",
      --   dependencies = { "kkharji/sqlite.lua" },
      -- },
    },
    config = function()
      require("spare.plugins.tools.telescope")
      require("telescope").load_extension("menu")
      -- require("telescope").load_extension("frecency")
      -- require("telescope").load_extension("file_browser")
      -- require("telescope").load_extension("command_palette")
      -- require("telescope").load_extension "lazy"
      -- vim.keymap.set("n", "<s-t>", "<cmd>Telescope<cr>")
      -- local builtin = require("telescope.builtin")
      -- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      -- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      -- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    event = "InsertEnter",
    enabled = false,
    config = function()
      require("spare.plugins.tools.ccc")
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
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerRun",
      "OverseerToggle",
      "OverseerQuickAction",
      "OverseerTaskAction",
    },
    config = function()
      require("spare.plugins.tools.overseer")
    end,
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
    "phaazon/hop.nvim",
    enabled = false,
    branch = "v2", -- optional but strongly recommended
    keys = function()
      return require("spare.config.keymaps").hop
    end,
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
      -- place this in one of your configuration file(s)
    end,
  },
  -- {
  -- 	"nvim-pack/nvim-spectre",
  -- 	event = "VeryLazy",
  -- 	dependencies = {
  -- 		"nvim-lua/plenary.nvim",
  -- 	},
  -- 	config = function()
  -- 		require("spare.plugins.tools.spectre")
  -- 	end,
  -- },
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
      return require("spare.config.keymaps").which_key
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
  {
    "jobo3208/nvim-mysql",
    build = "pip install -r requirements.txt",
  },
  {
    'gnikdroy/projections.nvim',
    enabled = false,
    config = function()
      require("projections").setup({
        -- workspaces = { -- Default workspaces to search for
        --   { ".git" },
        --   { "~/workspace", {} },
        --   "~/dev",
        --   { "~/.config/nvim/", { ".git", "init.lua" } },
        -- },
        -- patterns = { ".git", ".svn", ".hg" },      -- Default patterns to use if none were specified. These are NOT regexps.
        store_hooks = {
          pre = function()
            -- -- nvim-tree
            -- local nvim_tree_present, api = pcall(require, "nvim-tree.api")
            -- if nvim_tree_present then api.tree.close() end
            -- neo-tree
            if pcall(require, "neo-tree") then vim.cmd [[Neotree action=close]] end
          end
        }, -- pre and post hooks for store_session, callable | nil
        -- restore_hooks = { pre = nil, post = nil }, -- pre and post hooks for restore_session, callable | nil
        -- workspaces_file = "path/to/file",          -- Path to workspaces json file
        -- sessions_directory = "path/to/dir",        -- Directory where sessions are stored
      })
      -- Bind <leader>fp to Telescope projections
      require('telescope').load_extension('projections')
      vim.keymap.set("n", "<leader>fp", function() vim.cmd("Telescope projections") end)

      -- Autostore session on VimExit
      local Session = require("projections.session")
      vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
        callback = function() Session.store(vim.loop.cwd()) end,
      })

      local Session = require("projections.session")
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
          if vim.fn.argc() ~= 0 then return end
          local session_info = Session.info(vim.loop.cwd())
          if session_info == nil then
            Session.restore_latest()
          else
            Session.restore(vim.loop.cwd())
          end
        end,
        desc = "Restore last session automatically"
      })
      local Session = require("projections.session")
      vim.api.nvim_create_user_command("StoreProjectSession", function()
        Session.store(vim.loop.cwd())
      end, {})

      vim.api.nvim_create_user_command("RestoreProjectSession", function()
        Session.restore(vim.loop.cwd())
      end, {})
      local Workspace = require("projections.workspace")
      -- Add workspace command
      vim.api.nvim_create_user_command("AddWorkspace", function()
        Workspace.add(vim.loop.cwd())
      end, {})
    end
  },
  -- {
  --   "Olical/conjure",
  --   ft = { "clojure", "fennel", "python" }, -- etc
  --   -- [Optional] cmp-conjure for cmp
  --   dependencies = {
  --     {
  --       "PaterJason/cmp-conjure",
  --       config = function()
  --         local cmp = require("cmp")
  --         local config = cmp.get_config()
  --         table.insert(config.sources, {
  --           name = "buffer",
  --           option = {
  --             sources = {
  --               { name = "conjure" },
  --             },
  --           },
  --         })
  --         cmp.setup(config)
  --       end,
  --     },
  --   },
  --   config = function(_, opts)
  --     require("conjure.main").main()
  --     require("conjure.mapping")["on-filetype"]()
  --   end,
  --   init = function()
  --     -- Set configuration options here
  --     vim.g["conjure#debug"] = true
  --   end,
  -- },
  {
    "ahmedkhalf/jupyter-nvim",
    build = ":UpdateRemotePlugins",
    config = function()
      require("jupyter-nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
}
