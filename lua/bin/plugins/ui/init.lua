return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("bin.plugins.ui.catppuccin")
      local color = color or "catppuccin"
      vim.cmd.color(color)
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "UIEnter",
    keys = function()
      return require("bin.config.keymaps").bufferline
    end,
    config = function()
      require("bufferline").setup({
        -- options = {
        -- mode = "tabs",
        -- tab_size = 24,
        -- name_formatter = function(buf) -- buf contains:
        --   -- name                | str        | the basename of the active file
        --   -- path                | str        | the full path of the active file
        --   -- bufnr (buffer only) | int        | the number of the active buffer
        --   -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
        --   -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
        -- end,
        -- },
      })
    end,
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.opt.laststatus = 2
      require("bin.plugins.ui.lualine")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "UIEnter",
    config = function()
      require("bin.plugins.ui.indent-blankline")
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require("bin.plugins.ui.alpha")
    end,
  },
  -- {
  --   "yamatsum/nvim-cursorline",
  --   event = "UIEnter",
  --   config = function()
  --     require("bin.plugins.ui.cursorline")
  --   end,
  -- },
}
