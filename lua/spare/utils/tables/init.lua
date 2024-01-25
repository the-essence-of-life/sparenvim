local Config = {
  config = {
    options = {
      enabled = false,
      -- import = "spare.utils.tables.options",
      --- @type table
      set = require("spare.utils.tables.index").options,
      global = {
        mapleader = " "
      },
      -- global = require("spare.utils.tables.index").global_options,
    },
    keymaps = {
      enabled = false,
      --- @type table
      set = require("spare.utils.tables.index").keymaps,
      -- { mode = "n", keys = "<c-c>", exec = "<cmd>wq<cr>" },
      -- n = {},
      -- v = {},
    },
    autocmds = {
      enabled = false,
      --- @type boolean?
      lastplace = false,
      --- @type boolean?
      directory = false,
      --- @type boolean?
      based_term_support = true,
      --- @type table
      set = require("spare.utils.tables.index").autocmds,
      -- {
      --   event = "VimEnter",
      --   pattern = "*",
      --   callback = function()
      --     vim.opt.relativenumber = false
      --   end
      -- },
    },
    plugin = {
      enabled = false,
      --- @type string
      mode = "plugin-manager",
      --- @type boolean?
      auto_clean_plugins = false,
      -- colorscheme = "material",
    },
  },
}

function Config:set(cfg)
  if cfg then
    self.config = vim.tbl_deep_extend('force', self.config, cfg)
  end
  return self
end

function Config:get()
  return self.config
end

return setmetatable(Config, {
  __index = function(this, k)
    return this.state[k]
  end,
  __newindex = function(this, k, v)
    this.state[k] = v
  end,
})
