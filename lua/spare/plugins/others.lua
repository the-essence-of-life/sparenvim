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
    },
  },
  {
    "folke/persistence.nvim",
    event = "StdinReadPost",
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
    lazy = true
  },
  {
    "ThePrimeagen/harpoon",
    event = "StdinReadPost",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      Index.harpoon()
    end,
  },
}
