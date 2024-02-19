local M = {}

M.files_not_found = function (modules)
  local status_ok = pcall(require, modules)
  if not status_ok then
    local path = string.gsub(modules, ".", "/")
    local m_path = vim.fn.stdpath("config") .. "/lua/" .. path .. "/"
    if not vim.loop.fs_stat(m_path) then
      error("File not found!")
    end
  end
end

return M
