local M = {}

M.setup = function ()
  require("spare.config.options").options()
  require("spare.config.options").others()
  require("spare.config.keymaps").core()
  require("spare.config.lazy").deployment_lazy_user()
end

return M
