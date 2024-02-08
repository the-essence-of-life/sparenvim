local echo = function(str)
  vim.cmd("redraw")
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end
local M = {}
function M.setup(config)
  local Cfg = require("spare.utils.tables"):set(config):get()
  if Cfg.options then
    if Cfg.options.enabled then
      if type(Cfg.options.set) == "table" then
        for k, v in pairs(Cfg.options.set) do
          vim.opt[k] = v
        end
      end
      if type(Cfg.options.global) == "table" then
        for k, v in pairs(Cfg.options.global) do
          vim.g[k] = v
        end
      end
    end
  end
  if Cfg.keymaps then
    if Cfg.keymaps.enabled then
      if type(Cfg.keymaps.set) == "table" then
        for _, mappings in ipairs(Cfg.keymaps.set) do
          local mode = mappings[1]
          local keys = mappings[2]
          local exec = mappings[3]
          vim.keymap.set(mode, keys, exec)
        end
      end
    end
  end
  if Cfg.autocmds then
    if Cfg.autocmds.enabled then
      if Cfg.autocmds.lastplace then
        require("spare.utils.tables.index").lastplace()
      end
      if Cfg.autocmds.directory then
        require("spare.utils.tables.index").directory()
      end
      if Cfg.autocmds.based_term_support then
        require("spare.utils.tables.index").terminal()
      end
      if type(Cfg.autocmds.set) == "table" then
        for _, autocmds in ipairs(Cfg.autocmds.set) do
          vim.api.nvim_create_autocmd(autocmds.event or "VimEnter", {
            pattern = autocmds.pattern,
            callback = function()
              autocmds.callback()
            end
          })
        end
      end
    end
  end
  if type(Cfg.modules) == "table" then
    local modules = Cfg.modules
    for _, module in ipairs(modules) do
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
          "--branch=stable", -- latest stable release
          lazypath,
        })
      end
      vim.opt.rtp:prepend(lazypath)
      require("lazy").setup(Cfg.plugin.set)
    elseif type(Cfg.plugin.bootstraping) == "function" then
      Cfg.plugin.bootstraping()
    elseif not Cfg.plugin.set then
      return
    end
    if Cfg.autocmds.auto_clean_plugins then
      require("spare.utils.tables.index").plugin_cleaner()
    end
    if type(Cfg.plugin.colorscheme) == "string" then
    local color = color or Cfg.plugin.colorscheme
      vim.cmd("colorscheme ".. color .."")
    end
  end
end

return M
