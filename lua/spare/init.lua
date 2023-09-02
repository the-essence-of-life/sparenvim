local M = {}

M.setup = function()
  -- require("<path>") ==> require("~/.config/nvim/lua/<path>") --[[Note:it is wrong grammer,it only helps yourself to understand the work directory.]]
  -- [comment]set options
	local opts = require("spare.config.options")
  --- [comment]basic options
	opts:options()
	opts:others()
  -- [comment]set keymaps
  local keys = require("spare.config.keymaps")
  keys.core()
  -- [comment]set autocmds
  local autocmds = require("spare.config.autocmds")
  --- [comment]functions
  -- autocmds:directory()
  -- autocmds:lastplace()
  -- autocmds:user()
  -- autocmds:workspace()
  autocmds:all()
  -- [comment]set plugin-manager
  local bs = require("spare.config.lazy")
  --- [comment]package-manager
  bs:pm_bootstraping()
  --- [comment]plugins
  bs:deployment_lazy()
end

return M
