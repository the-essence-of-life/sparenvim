local Index = require("spare.utils.index")
local builtin = require("spare.utils.builtin")
local echo = function(str)
  vim.cmd("redraw")
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

---@class SpareConfig: SpareOptions
local M = {}

---@class SpareOptions
local defaults = {
  options = {
    enabled = false,
    -- import = "spare.utils.tables.options",
    --- @type table
    set = Index.options,
    --- @type table
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
    --- @type string?
    colorscheme = "catppuccin",
    --- @type table
    set = Index.lazy,
  },
}

function M.setup(opts)
  Cfg = vim.tbl_deep_extend("force", defaults, opts or {}) or {}
  if Cfg.options then
    if Cfg.options.enabled then
      builtin.options(Cfg.options.set)
    end
  end
  if Cfg.keymaps then
    if Cfg.keymaps.enabled then
      builtin.keymaps(Cfg.keymaps.set)
    end
  end
  if Cfg.autocmds then
    if Cfg.autocmds.enabled then
      if Cfg.autocmds.lastplace then
        Index.lastplace()
      end
      if Cfg.autocmds.directory then
        Index.directory()
      end
      if Cfg.autocmds.based_term_support then
        Index.terminal()
      end
      if type(Cfg.autocmds.set) == "function" then
        Cfg.autocmds.set()
      end
    end
  end
  if type(Cfg.modules) == "table" then
    for _, module in ipairs(Cfg.modules) do
      local ok = pcall(require, module)
      if ok then
        require(module)
      end
    end
  end
  if Cfg.plugin.enabled then
    if type(Cfg.plugin.set) == "table" then
      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not vim.loop.fs_stat(lazypath) then
        echo(" Installing the lazy.nvim to ~/.local/share/nvim/lazy/lazy.nvim...")
        vim.fn.system({
          "git",
          "clone",
          "--filter=blob:none",
          "https://github.com/folke/lazy.nvim.git",
          "--branch=stable",
          lazypath,
        })
      end
      vim.opt.rtp:prepend(lazypath)
      ---@module 'lazy'
      ---@type function
      require("lazy").setup(Cfg.plugin.set)
    elseif type(Cfg.plugin.set) == "function" then
      ---@type function
      Cfg.plugin.set()
    elseif not Cfg.plugin.set then
      return {}
    end
    if type(Cfg.plugin.colorscheme) == "string" then
      local color = Cfg.plugin.colorscheme or "habamax"
      vim.cmd("colorscheme " .. color .. "")
    elseif type(Cfg.plugin.colorscheme) == "nil" then
      local color = "habamax"
      vim.cmd("colorscheme " .. color .. "")
    elseif type(Cfg.plugin.colorscheme) == "function" then
      ---@type function
      Cfg.plugin.colorscheme()
    end
  end
end

setmetatable(M, {
  __index = function(_, key)
    if Cfg == nil then
      return vim.deepcopy(defaults)[key]
    end
    return Cfg[key]
  end
})

return M
