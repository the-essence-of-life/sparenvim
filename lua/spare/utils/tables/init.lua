local Config = {
  config = {
    options = {
      enabled = false,
      -- import = "spare.utils.tables.options",
      --- @type tablelib
      set = require("spare.utils.tables.index").options,
      --- @type tablelib
      global = {
        --- @type string
        mapleader = " ",
        maplocalleader = " "
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
      --- @type table
      -- user_plugins = "user.plugin",
      -- colorscheme = "material",
      set = {
        spec = {
          { import = "spare.plugins" },
        },
        git = {
          url_format = "https://github.com/%s.git",
        },
        install = {
          colorscheme = {
            "github_dark",
            "catppuccin",
            "material",
            "tokyonight",
          },
        },
        ui = {
          border = "rounded",
        },
        checker = {
          -- automatically check for plugin updates
          enabled = false,
          concurrency = 1,  --[email protected] number? set to 1 to check for updates very slowly
          notify = false,   -- get a notification when new updates are found
          frequency = 3600, -- check for updates every hour
        },
        profiling = {
          -- Enables extra stats on the debug tab related to the loader cache.
          -- Additionally gathers stats about all package.loaders
          loader = true,
          -- Track each new require in the Lazy profiling tab
          require = false,
        },
        change_detection = {
          -- automatically check for config file changes and reload the ui
          enabled = true,
          notify = false, -- get a notification when changes are found
        },
        performance = {
          rtp = {
            disabled_plugins = {
              "netrwPlugin"
            }
          }
        },
      },
      -- colorscheme = "tokyonight-storm",
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
