local M = {}

M.options = function(tables, tags)
  if tags == "options" then
    if type(tables) == "table" then
      for k, v in pairs(tables) do
        vim.opt[k] = v
      end
    end
  end
  if tags == "global_options" then
    if type(tables) == "table" then
      for k, v in pairs(tables) do
        vim.go[k] = v
      end
    end
  end
  if tags == "global_var" then
    if type(tables) == "table" then
      for k, v in pairs(tables) do
        vim.g[k] = v
      end
    end
  end
end

M.keymaps = function(tables)
  if type(tables) == "table" then
    for _, lsp_mapping in ipairs(tables) do
      local mode = lsp_mapping[1]
      local keys = lsp_mapping[2]
      local exec = lsp_mapping[3]
      local desc = lsp_mapping[4] or "<none>"
      local nowait = lsp_mapping.nowait
      local silent = lsp_mapping.silent
      local expr = lsp_mapping.expr
      vim.keymap.set(mode, keys, exec, {
        desc = desc,
        nowait = nowait,
        expr = expr or false,
        silent = silent or false,
      })
    end
  end
end

return M
