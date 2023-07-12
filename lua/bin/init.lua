local M = {}

M.setup = function()
  require("bin.config.options").options()
  require("bin.config.options").others()
  require("bin.config.keymaps").core()
  require("bin.config.autocmds").directory()
  require("bin.config.autocmds").lastplace()
  require("bin.config.autocmds").test()
  require("bin.config.lazy").deployment_lazy()
end

return M
