local M = {}

M.setup = function()
  require("spare.utils").setup({
    options = {
      enabled = true,
    },
    keymaps = {
      enabled = true,
    },
    autocmds = {
      enabled = true,
      lastplace = true,
      directory = true,
    },
    plugin = {
      enabled = true,
      mode = "plugins",
    },
  })
end

return M
