local Cfg = require("spare.utils.tables"):set(config):get()

local start = vim.health.start or vim.health.report_start
local info = vim.health.info or vim.health.report_info
local ok = vim.health.ok or vim.health.report_ok
local warn = vim.health.warn or vim.health.report_warn
local error = vim.health.error or vim.health.report_error

local M = {}

function M.check()
  -- logo
info([[   _________  ____ _________]])
info([[  / ___/ __ \/ __ `/ ___/ _ \]])
info([[ (__  ) /_/ / /_/ / /  /  __/]])
info([[/____/ .___/\__,_/_/   \___/]])
info([[    /_/]])
  if vim.fn.has("nvim-0.9.5") == 1 then
    ok("Using Neovim >= 0.9.5")
  else
    warn("Your neovim version is too old.", "Try to exec `<your-system-package-manager> update neovim` in your terminal.")
  end
  start("Nerd Font Support")
  info("There are three signs in the line:")
  info("     ")
  info("If you see a plus,a box and a keyboard,explain that your terminal supports nerdfont.")
  info("If you want to download nerdfont,you can go out for the link:`https://www.nerdfonts.com/font-downloads`")

  start("Dependencies Check List:")
  if vim.fn.executable("git") == 1 then
    ok("git installed.    #plugins download")
  else
    error("install git?", "Try to exec `<your-system-package-manager> install git` in your terminal.")
  end
  if vim.fn.executable("node") == 1 then
    ok("node installed.    #mason dependencies")
  else
    error("install node.js?", "Try to exec `<your-system-package-manager> install nodejs` in your terminal.")
  end
  if vim.fn.executable("rg") == 1 then
    ok("ripgrep installed.    #telescope live-grep")
  else
    warn("install ripgrep?", "Try to exec `<your-system-package-manager> install ripgrep` in your terminal.")
  end
  if vim.fn.executable("fd") == 1 then
    ok("fd installed.    #telescope find-files")
  else
    warn("install fd?", "Try to exec `<your-system-package-manager> install fd` in your terminal.")
  end
  if vim.fn.executable("lua-language-server") == 1 then
    ok("lua-ls installed.    #default language-server")
  else
    warn("You should install it to get the language check.", "Try to exec `<your-system-package-manager> install lua-language-server` in your terminal.")
  end

  start("Configruation:")
  info("Tips:use `set = {}` can load the neovim api.")
  local configruation = vim.fn.stdpath("config") .. "/lua/user/config.lua"
  if vim.loop.fs_stat(configruation) then
    local options = Cfg.options
    if options.enabled == false then
      info("You can use `options = { enabled = true }` to set options.")
    end
    if options.set == nil then
      info("You can use `options = { set = {} }` to set options.")
    end
    local keymaps = Cfg.keymaps
    if keymaps.enabled == false then
      info("You can use `keymaps = { enabled = true }` to set keymaps.")
    end
    if keymaps.set == nil then
      info("You can use `keymaps = { set = {} }` to set keymaps.")
    end
    local autocmds = Cfg.autocmds
    if autocmds.enabled == false then
      info("You can use `autocmds = { enabled = true }` to set autocmds.")
    end
    if autocmds.set == nil then
      info("You can use `autocmds = { set = {} }` to set autocmds.")
    end
    local plugins = Cfg.plugin
    if plugins.enabled == false then
      info("You can use `plugin = { enabled = true }` to install plugins.")
    end
    -- for _,check in pairs(Cfg.options) do
    --   M.set_options(check)
    -- end
    local user_config = vim.fn.stdpath("config") .. "/lua/user/"
    if vim.loop.fs_stat(user_config) then
      ok("user config defind.")
      info("All configruations are set,options always set.")
      info("You can check https://github.com/the-essence-of-life/spare for check more information.")
      info("You can use `:checkhealth spare.utils` to open it again.")
    end
  else
    start("Error:")
    error("Config not found!", "You should create a user config in `~/.config/nvim/lua/user/config.lua`.Use `mkdir -p ~/.config/nvim/lua/user/ && touch config.lua` to create it.")
  end

  local user_modules = Cfg.modules
  if user_modules then
    start("Modules:")
    local require_modules = Cfg.modules
    for _, modules in ipairs(require_modules) do
      local status_ok = pcall(require, modules)
      if not status_ok then
        error("Modules `" .. modules .. "` found some errors!")
      else
        ok("Modules `" .. modules .. "` loaded correctly!")
      end
    end
  end
end

-- function M.set_options(keys)
--   for key in pairs(keys) do
--     if not vim.tbl_contains(M.vaild_keys, key) then
--       ok("new options: <" .. key .. ">")
--     end
--   end
-- end

-- M.vaild_keys = vim.tbl_get(Cfg.options.set)

return M
