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

M.default_plugins_dir = vim.fn.stdpath("config") .. "/lua/spare/plugins/"
M.default_user_plugins_dir = vim.fn.stdpath("config") .. "/lua/user/plugins/"
M.default_lazy_dir = vim.fn.stdpath("data") .. "/lazy/lazy.nvim/"

M.diag_hl_guoup = function ()
  local hl_group = {
    "DiagnosticUnderlineError",
    "DiagnosticUnderlineWarn",
    "DiagnosticUnderlineHint",
    "DiagnosticUnderlineInfo",
    "DiagnosticUnderlineOk",
  }
  local colors = {
    "red",
    "yellow",
    "green",
    "blue",
    "white"
  }
  vim.api.nvim_set_hl(0, hl_group[1], { fg = colors[1] })
  vim.api.nvim_set_hl(0, hl_group[2], { fg = colors[2] })
  vim.api.nvim_set_hl(0, hl_group[3], { fg = colors[3] })
  vim.api.nvim_set_hl(0, hl_group[4], { fg = colors[4] })
  vim.api.nvim_set_hl(0, hl_group[5], { fg = colors[5] })
end

return M
