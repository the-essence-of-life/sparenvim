local Index = require("spare.plugins.index.utils")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "UIEnter",
    dependencies = {
      "HiPhish/nvim-ts-rainbow2",
      "windwp/nvim-ts-autotag",
    },
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      Index.treesitter()
      -- require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/noice.nvim",
    event = "UIEnter",
    config = function()
      Index.noice()
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "folke/persistence.nvim",
    lazy = true, -- this will only start session saving when an actual file was opened
    -- module = "persistence",
    config = function()
      Index.persistence()
    end,
  },
  {
    "m4xshen/autoclose.nvim",
    event = "InsertEnter",
    config = function()
      Index.autoclose()
    end,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
  },
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      Index.harpoon()
    end,
  },
}
