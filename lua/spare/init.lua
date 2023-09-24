local M = {}

M.setup = function()
require("spare.utils").setup({
  options = {
    basic = false,
    vimplugins = false
  },
  keymaps = {
    enabled = false
  },
  autocmds = {
    lastplace = false,
    directory = false,
  },
  plugin = {
    mode = nil,
  },
})
end

return M
