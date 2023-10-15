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
  local Cfg = require("spare.utils.tables"):set(config):get()
  if Cfg.options then
    -- if Cfg.options.basic then
    -- pcall(require("spare.utils.options").options())
    -- end
    -- if Cfg.options.vimplugins then
    --  pcall(require("spare.utils.options").others())
    -- end
    if type(Cfg.options.import) == "string" then
      local table = require(Cfg.options.import).opt
      for k, v in pairs(table) do
        vim.opt[k] = v
      end
    end
    if type(Cfg.options.settings) == "table" then
      for k, v in pairs(Cfg.options.settings) do
        vim.opt[k] = v
      end
    end
  end
  if Cfg.keymaps then
    -- if Cfg.keymaps.enabled then
    --   require("spare.utils.keymaps").core()
    -- end
    if type(Cfg.keymaps.import) == "string" then
      local table = require(Cfg.keymaps.import) or require("user.config.options")
      for _, mappings in ipairs(table) do
        vim.keymap.set(mappings.mode, mappings.keys, mappings.exec)
      end
    end
    for _, mapping in ipairs(Cfg.keymaps) do
      vim.keymap.set(mapping.mode, mapping.keys, mapping.exec)
    end
  end
  if Cfg.autocmds then
    if Cfg.autocmds.lastplace then
      require("spare.utils.autocmds").lastplace()
    end
    if Cfg.autocmds.directory then
      require("spare.utils.autocmds").directory()
    end
    if type(Cfg.autocmds.import) == "string" then
      local table = require(Cfg.autocmds.import)
      for _, autocmds in ipairs(table) do
        vim.api.nvim_create_autocmd(autocmds.event, {
          pattern = autocmds.pattern,
          callback = function()
            autocmds.callback()
          end
        })
      end
    end
    for _, autocmd in ipairs(Cfg.autocmds) do
      if autocmd.event ~= nil and autocmd.pattern ~= nil and autocmd.callback ~= nil then
        vim.api.nvim_create_autocmd(autocmd.event, {
          pattern = autocmd.pattern,
          callback = function()
            autocmd.callback()
          end
        })
      end
    end
  end
  if Cfg.plugin.mode == "plugin-manager" then
    require("spare.utils.lazy").pm_bootstraping()
  elseif Cfg.plugin.mode == "plugins" then
    require("spare.utils.lazy").pm_bootstraping()
    require("spare.utils.lazy").deployment_lazy()
  end
  if type(Cfg.plugin.bootstraping) == "function" then
    Cfg.plugin.bootstraping()
  end
end

-- M.keymaps = function()
--   -- [comment]set keymaps
--   local keys = require("spare.config.keymaps")
--   keys.core()
-- end
--
-- M.autocmd = function()
--   -- [comment]set autocmds
--   local autocmds = require("spare.config.autocmds")
--   --- [comment]functions
--   -- autocmds:directory()
--   -- autocmds:lastplace()
--   -- autocmds:user()
--   -- autocmds:workspace()
--   autocmds:all()
-- end
--
-- M.plugins = function()
--   -- [comment]set plugin-manager
--   local bs = require("spare.config.lazy")
--   --- [comment]package-manager
--   bs:pm_bootstraping()
--   --- [comment]plugins
--   bs:deployment_lazy()
-- end

return M
