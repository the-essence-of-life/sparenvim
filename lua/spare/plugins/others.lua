local Index = require("spare.plugins.index.others")

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
    event = "TextChanged",
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
