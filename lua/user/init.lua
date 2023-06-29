local M = {}

M.setup = function ()
  require("bin.config.options").options()
  require("bin.config.options").others()
  require("bin.config.keymaps").core()
  require("bin.config.lazy").deployment_lazy_user()
end

return M
