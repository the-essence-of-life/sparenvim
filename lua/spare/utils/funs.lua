local M = {}

M.ps = function(tbl)
  if type(tbl) == "table" then
    for key, value in pairs(tbl) do
      require(key).setup(value)
    end
  end
end

M.diag_hl_guoup = function()
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
  vim.api.nvim_set_hl(0, hl_group[1], { bg = colors[1] })
  vim.api.nvim_set_hl(0, hl_group[2], { bg = colors[2] })
  vim.api.nvim_set_hl(0, hl_group[3], { bg = colors[3] })
  vim.api.nvim_set_hl(0, hl_group[4], { bg = colors[4] })
  vim.api.nvim_set_hl(0, hl_group[5], { bg = colors[5] })
end

return M
