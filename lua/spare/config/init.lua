local M = {}

-- M.option = function()
--   -- require("<path>") ==> require("~/.config/nvim/lua/<path>") --[[Note:it is wrong grammer,it only helps yourself to understand the work directory.]]
--   -- [comment]set options
-- 	local opts = require("spare.config.options")
--   --- [comment]basic options
-- 	opts:options()
-- 	opts:others()
-- end

-- M.options = {
--   basic = function()
-- 	  require("spare.config.options").options()
--   end,
--   settings = function()
--     require("spare.config.options").others()
--   end,
--   all = function ()
-- 	  require("spare.config.options").options()
--     require("spare.config.options").others()
--   end
-- }

function M.setup(config)
  local cfg = require("spare.config.tables"):set(config):get()
  if cfg.options then
    if cfg.options.basic then
      require("spare.config.options").options()
    end
    if cfg.options.vimplugins then
      require("spare.config.options").others()
    end
    if type(cfg.options.settings) == "table" then    
      for k, v in pairs(cfg.options.settings) do
        vim.opt[k] = v
      end
    end
  end
  if cfg.keymaps then
    if cfg.keymaps.enabled then
      require("spare.config.keymaps").core()
    end
    for _,mapping in ipairs(cfg.keymaps) do
      vim.keymap.set(mapping.mode, mapping.keys, mapping.exec)
    end
  end
  if cfg.autocmds then
    if cfg.autocmds.lastplace then
      require("spare.config.autocmds").lastplace()
    end
    if cfg.autocmds.directory then
      require("spare.config.autocmds").directory()
    end
  end
  if cfg.plugin.mode == "plugin-manager" then
    require("spare.config.lazy").pm_bootstraping()
  elseif cfg.plugin.mode == "plugins" then
    require("spare.config.lazy").pm_bootstraping()
    require("spare.config.lazy").deployment_lazy()
  end
end

M.keymaps = function()
  -- [comment]set keymaps
  local keys = require("spare.config.keymaps")
  keys.core()
end

M.autocmd = function()
  -- [comment]set autocmds
  local autocmds = require("spare.config.autocmds")
  --- [comment]functions
  -- autocmds:directory()
  -- autocmds:lastplace()
  -- autocmds:user()
  -- autocmds:workspace()
  autocmds:all()
end

M.plugins = function()
  -- [comment]set plugin-manager
  local bs = require("spare.config.lazy")
  --- [comment]package-manager
  bs:pm_bootstraping()
  --- [comment]plugins
  bs:deployment_lazy()
end

return M
