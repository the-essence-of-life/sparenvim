local M = {}

M.ps = function(tbl)
  -- local tbl = require("user.plugins").pn
  -- local tbl = {
  --   Comment = {
  --     padding = false
  --   }
  -- }
  if type(tbl) == "table" then
    for key, value in pairs(tbl) do
      require(key).setup(value)
    end
  end
end

M.default_plugins_dir = vim.fn.stdpath("config") .. "/lua/spare/plugins"

return M
