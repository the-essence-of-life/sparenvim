local Index = require("spare.plugins.index.others")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    cond = function()
      return vim.fn.executable("gcc") == 1
    end,
    event = "BufRead",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    opts = Index.treesitter
  },
  {
    "folke/noice.nvim",
    event = "UIEnter",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
    opts = Index.noice
  },
  {
    "folke/persistence.nvim",
    event = "BufRead",
    -- module = "persistence",
    opts = Index.persistence
  },
  {
    "m4xshen/autoclose.nvim",
    event = "InsertEnter",
    opts = Index.autoclose
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    opts = Index.dressing
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event ="BufRead",
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end
  },
}
