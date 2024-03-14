local Index = require("spare.utils.index")

local Config = {
  config = {
    options = {
      enabled = false,
      -- import = "spare.utils.tables.options",
      --- @type table
      set = Index.options,
      --- @type table
<<<<<<< HEAD
=======
      global = Index.global,
>>>>>>> ae361800f47b27cfc3e7721b25cc9ee96a337e9c
    },
    keymaps = {
      enabled = false,
      --- @type table
      set = Index.keymaps,
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
      set = Index.autocmds,
      -- {
      --   event = "VimEnter",
      --   pattern = "*",
      --   callback = function()
      --     vim.opt.relativenumber = false
      --   end
      -- },
    },
    health = {
      check = {
        basic = true,
        lsp = true,
      },
    },
    plugin = {
      enabled = false,
      --- @type string
      mode = "plugin-manager",
      --- @type boolean?
      auto_clean_plugins = true,
      --- @type table
<<<<<<< HEAD
      set = Index.lazy,
      -- disabled = {
      --   which_key = true
      -- },
=======
      set = Index.lazy
>>>>>>> ae361800f47b27cfc3e7721b25cc9ee96a337e9c
      -- user_plugins = "user.plugin",
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
