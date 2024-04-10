local Index = require("spare.utils.index")
local builtin = require("spare.utils.builtin")
-- local echo = function(str)
--   vim.cmd("redraw")
--   vim.api.nvim_echo({ { str, "Bold" } }, true, {})
-- end

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
    set = {},
  },
  health = {
    check = {
      basic = true,
      lsp = true,
    },
  },
  colorscheme = "catppuccin",
  safe_uninstall_plugins = {
    -- others = true,
    -- others2 = true,
  },
}

---@class SpareMergeConfigTable
local migration = {}

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
      if type(Cfg.autocmds.set) == "table" then
        for events, keys in pairs(Cfg.autocmds.set) do
          vim.api.nvim_create_autocmd(events, keys)
        end
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
  if type(Cfg.colorscheme) == "string" then
    local color = Cfg.colorscheme or "habamax"
    vim.cmd("colorscheme " .. color .. "")
  elseif type(Cfg.colorscheme) == "nil" then
    local color = "habamax"
    vim.cmd("colorscheme " .. color .. "")
  elseif type(Cfg.colorscheme) == "function" then
    ---@type function
    Cfg.plugin.colorscheme()
  end
  return Cfg
end

function M.sync(mgr)
  Mgr = vim.tbl_deep_extend("force", migration, mgr or {}) or {}
  for _, config in ipairs(Mgr) do
    local config_type = config[1]
    local modules = config.import
    if type(config_type) == "string" and config_type == "option" then
      require(modules)
    end
    if type(config_type) == "string" and config_type == "keymap" then
      require(modules)
    end
    if type(config_type) == "string" and config_type == "autocmd" then
      require(modules)
    end
  end
end

setmetatable(M, {
  __index = function(_, key)
    if Cfg == nil then
      return vim.deepcopy(defaults)[key]
    end
    if Mgr == nil then
      return vim.deepcopy(defaults)[key]
    end
    return Cfg[key] and Mgr[key]
  end
})

return M
