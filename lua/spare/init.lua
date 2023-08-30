local M = {}

M.setup = function()
  local opts = require("spare.config.options")
  opts:options()
  opts:others()
  local keys = require("spare.config.keymaps")
  keys.core()
  local autocmds = require("spare.config.autocmds")
  autocmds:directory()
  autocmds:lastplace()
  autocmds:test()
  local bs = require("spare.config.lazy")
  bs:deployment_lazy()
end

return M
