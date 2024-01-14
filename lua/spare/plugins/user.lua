local status_ok = pcall(require, "user.plugins")
if status_ok then
  return {
    require("user.plugins").ui,
    require("user.plugins").lsp,
    require("user.plugins").colorscheme,
    require("user.plugins").tools,
    require("user.plugins").modules,
  }
else
  return {}
end
-- return {}
