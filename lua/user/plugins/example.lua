return {
  -- {
  --   "EdenEast/nightfox.nvim",
  --   init = function()
  --     vim.cmd("colorscheme nightfox")
  --   end
  -- }, -- lazy
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.o.background = "dark" -- or "light" for light mode
  --     vim.cmd([[colorscheme gruvbox]])
  --   end
  -- }
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
        intergrations = {
          indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
          },
          cmp = true,
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
            inlay_hints = {
              background = true,
            },
            neotree = true,
            ts_rainbow2 = true,
            treesitter = true,
            treesitter_context = true,
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    'Mofiqul/dracula.nvim',
    enabled = false,
    config = function()
      require("dracula").setup()
      vim.cmd [[colorscheme dracula-soft]]
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
}
