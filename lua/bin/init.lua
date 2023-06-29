-- M = {}
--
-- M.options = require("bin.config.options")
-- M.keymaps = require("bin.config.keymaps")
-- M.plugins = require("bin.config.lazy")
--
-- return M

local M = {}

M.setup = function()
  require("bin.config.options").options()
  require("bin.config.options").others()
  require("bin.config.keymaps").core()
  require("bin.config.lazy").deployment_lazy()
end

return M
