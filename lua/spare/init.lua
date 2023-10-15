local M = {}

M.setup = function()
require("spare.utils").setup({
  options = {
    -- basic = true,
    -- vimplugins = true,
  },
  keymaps = {
    enabled = true,
    import = "spare.config.keys",
  },
  autocmds = {
    lastplace = true,
    directory = true,
  },
  plugin = {
    mode = "plugins",
  },
})
end

return M
