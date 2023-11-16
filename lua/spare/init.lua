local M = {}

M.setup = function()
  require("spare.utils").setup({
    options = {
      enabled = true,
      set = {
        relativenumber = false
      },
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
