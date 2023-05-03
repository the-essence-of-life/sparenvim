do
  return {
    {
      "nvim-tree/nvim-tree.lua",
      -- keys = {
      --   { "<c-n>", "<cmd>NvimTreeToggle<cr>", desc = "NeoTree" },
      -- },
      config = function()
        require("bin.plugins.tools.nvim-tree")
      end,
    },
    -- {
    -- 	"nvim-neo-tree/neo-tree.nvim",
    -- 	version = "v2.x",
    -- 	dependencies = {
    -- 		"nvim-lua/plenary.nvim",
    -- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    -- 		"MunifTanjim/nui.nvim",
    -- 	},
    -- 	keys = {
    -- 		{ "<c-n>", "<cmd>Neotree<cr>", desc = "NeoTree" },
    -- 	},
    -- 	config = function()
    -- 		require("bin.plugins.tools.neotree")
    -- 	end,
    -- },
    {
      "numToStr/Comment.nvim",
      event = "VeryLazy",
      config = true,
    },
    {
      'kevinhwang91/nvim-ufo',
      dependencies = 'kevinhwang91/promise-async',
      config = function()
        require('bin.plugins.tools.ufo')
      end
    },
    {
      "nvim-telescope/telescope.nvim",
      keys = {
        { "m", "<cmd>Telescope menu<cr>", mode = "n" },
      },
      tag = "0.1.1",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "octarect/telescope-menu.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "LinArcX/telescope-command-palette.nvim",
        {
          "nvim-telescope/telescope-frecency.nvim",
          dependencies = { "kkharji/sqlite.lua" },
        },
      },
      config = function()
        require("bin.plugins.tools.telescope")
        require("telescope").load_extension("menu")
        require("telescope").load_extension("frecency")
        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("command_palette")
        vim.keymap.set("n", "<s-t>", "<cmd>Telescope<cr>")
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      end,
    },
    {
      "uga-rosa/ccc.nvim",
      config = function()
        require("bin.plugins.tools.ccc")
      end,
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
        require("bin.plugins.tools.overseer")
      end,
    },
    {
      "akinsho/toggleterm.nvim",
      cmd = "ToggleTerm",
      version = "*",
      config = function()
        require("bin.plugins.tools.toggleterm")
      end,
    },
    {
      "lewis6991/gitsigns.nvim",
      config = true,
    },

    {
      "folke/trouble.nvim",
      cmd = "Trouble",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        require("bin.plugins.tools.trouble")
      end,
    },
    {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("bin.plugins.tools.todo-comments")
      end,
    },
    {
      "iamcco/markdown-preview.nvim",
      build = "cd app && npm install",
      config = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
    },
    {
      "ixru/nvim-markdown",
      -- ft = "md",
      config = function()
        require("bin.plugins.tools.markdown")
      end,
    },
    {
      "phaazon/hop.nvim",
      branch = "v2", -- optional but strongly recommended
      keys = {
        { "<a-m>", "<cmd>HopChar2<cr>" },
      },
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
        -- place this in one of your configuration file(s)
      end,
    },
    {
      'm4xshen/autoclose.nvim',
      config = function()
        require('bin.plugins.tools.autoclose')
      end
    },
    {
      'nvim-pack/nvim-spectre',
      dependencies = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('bin.plugins.tools.spectre')
      end
    },
    {
      "ziontee113/icon-picker.nvim",
      dependencies = {
        "stevearc/dressing.nvim"
      },
      config = function()
        require("icon-picker").setup({
          disable_legacy_commands = true
        })
      end,
    },
    -- {
    -- {
    -- 	"nvim-neo-tree/neo-tree.nvim",
    -- 	version = "v2.x",
    -- 	dependencies = {
    -- 		"nvim-lua/plenary.nvim",
    -- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    -- 		"MunifTanjim/nui.nvim",
    -- 	},
    --    config = function ()
    --      require('bin.plugins.tools.neotree')
    --    end
    -- },
  }
end

local a = {
  "autoclose",
  "trouble",
}
for i, v in ipairs(a) do
  local ok = pcall(require, i, v)
  if not ok then
    return
  end
end
