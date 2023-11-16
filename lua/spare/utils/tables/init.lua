local Config = {
  config = {
    options = {
      -- import = "spare.utils.tables.options",
      set = require("spare.utils.tables.index").options
    },
    keymaps = {
      set = require("spare.utils.tables.index").keymaps
      -- { mode = "n", keys = "<c-c>", exec = "<cmd>wq<cr>" },
      -- n = {},
      -- v = {},
    },
    autocmds = {
      lastplace = false,
      directory = false,
      set = require("spare.utils.tables.index").autocmds
      -- {
      --   event = "VimEnter",
      --   pattern = "*",
      --   callback = function()
      --     vim.opt.relativenumber = false
      --   end
      -- },
    },
    plugin = {
      mode = "plugin-manager",
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
