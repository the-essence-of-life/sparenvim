local Cfg = require("spare.utils.tables"):set(config):get()

local health = {
  start = vim.health.start or vim.health.report_start,
  info = vim.health.info or vim.health.report_info,
  ok = vim.health.ok or vim.health.report_ok,
  warn = vim.health.warn or vim.health.report_warn,
  error = vim.health.error or vim.health.report_error,
}

local M = {}

function M.check()
  -- logo
  health.info([[   _________  ____ _________]])
  health.info([[  / ___/ __ \/ __ `/ ___/ _ \]])
  health.info([[ (__  ) /_/ / /_/ / /  /  __/]])
  health.info([[/____/ .___/\__,_/_/   \___/]])
  health.info([[    /_/]])
  if vim.fn.has("nvim-0.9.5") == 1 then
    health.ok("Using Neovim >= 0.9.5")
  else
    health.warn("Your neovim version is too old.",
      "Try to exec `<your-system-package-manager> update neovim` in your terminal.")
  end
  health.start("Nerd Font Support")
  health.info("There are three signs in the line:")
  health.info("     ")
  health.info("If you see a plus,a box and a keyboard,explain that your terminal supports nerdfont.")
  health.info("If you want to download nerdfont,you can go out for the link:`https://www.nerdfonts.com/font-downloads`")
  if vim.fn.has("termux") then
    health.info("Tips:Termux user can put font into `~/.termux/font.ttf`")
  end

  health.start("Dependencies Check List:")
  if vim.fn.executable("git") == 1 then
    health.ok("git installed.    #plugins download")
  else
    health.error("Install git?", "Download the binary and add it for the $PATH.")
  end
  local de_basic = {
    rg = "Ripgrep",
    fd = "Find-Files",
  }
  for dep, name in pairs(de_basic) do
    if vim.fn.executable(dep) == 1 then
      health.ok(name .. " installed.    #Basic")
    else
      if Cfg.health.check.basic then
        health.warn("Invaild " .. dep .. "." , "Download the binary and add it for the $PATH.")
      end
    end
  end
  local de_lsp = { "node", "lua-language-server" }
  for _, de_lsp_check in ipairs(de_lsp) do
    if vim.fn.executable(de_lsp_check) == 1 then
      health.ok(de_lsp_check .. " installed.    #LSP")
    else
      if Cfg.health.check.lsp then
        health.warn('Invaild' .. de_lsp_check .. '? Your language server cannot run correctly.',
          'Download the binary and add it for the $PATH.')
      end
    end
  end

  health.start("Configruation:")
  health.info("Tips:use `set = {}` can load the neovim api.")
  local configruation = vim.fn.stdpath("config") .. "/lua/user/config.lua"
  if vim.loop.fs_stat(configruation) then
    local options = Cfg.options
    if options.enabled == false then
      health.info("You can use `options = { enabled = true }` to set options.")
    end
    if options.set == nil then
      health.info("You can use `options = { set = {} }` to set options.")
    end
    local keymaps = Cfg.keymaps
    if keymaps.enabled == false then
      health.info("You can use `keymaps = { enabled = true }` to set keymaps.")
    end
    if keymaps.set == nil then
      health.info("You can use `keymaps = { set = {} }` to set keymaps.")
    end
    local autocmds = Cfg.autocmds
    if autocmds.enabled == false then
      health.info("You can use `autocmds = { enabled = true }` to set autocmds.")
    end
    if autocmds.set == nil then
      health.info("You can use `autocmds = { set = {} }` to set autocmds.")
    end
    local plugins = Cfg.plugin
    if plugins.enabled == false then
      health.info("You can use `plugin = { enabled = true }` to install plugins.")
    end
    -- for _,check in pairs(Cfg.options) do
    --   M.set_options(check)
    -- end
    local user_config = vim.fn.stdpath("config") .. "/lua/user/"
    if vim.loop.fs_stat(user_config) then
      health.ok("user config defind.")
      health.info("All configruations are set,options always set.")
      health.info("You can check https://github.com/the-essence-of-life/spare for check more information.")
      health.info("You can use `:checkhealth spare.utils` to open it again.")
    end
  else
    health.start("Error:")
    health.error("Config not found!",
      "You should create a user config in `~/.config/nvim/lua/user/config.lua`.Use `mkdir -p ~/.config/nvim/lua/user/ && touch config.lua` to create it.")
  end

  local user_modules = Cfg.modules
  if user_modules then
    health.start("Modules:")
    local require_modules = Cfg.modules
    for _, modules in ipairs(require_modules) do
      local ok = pcall(require, modules)
      if not ok then
        health.error("Modules `" .. modules .. "` found some errors!")
      else
        health.ok("Modules `" .. modules .. "` loaded correctly!")
      end
    end
  end
  health.start("International Storage:")
  if vim.fn.has("termux") then
    local printin = vim.fn.system({ 'df', '-h', '/storage/emulated/0' })
    health.info(printin)
  elseif vim.fn.has("windows") then
    local printin = vim.fn.system({ 'Get-Volume', '|',
      'Select-Object, DriveLetter, FileSystemLabel, Capacity, Sizeremaining' })
    health.info(printin)
  else
    local printin = vim.fn.system({ 'df', '-h', '/' })
    health.info(printin)
  end
end

return M
