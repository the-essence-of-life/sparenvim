local M = {}

M.options = function(tables)
  for table, tags in pairs(tables) do
    for settings, config in pairs(tags) do
      vim[table][settings] = config
    end
  end
end

M.keymaps = function(tables)
  if type(tables) == "table" then
    for mode, mode_mapping in pairs(tables) do
      for mappings, settings in pairs(mode_mapping) do
        if type(settings) == 'table' then
          local keys_mode = mode
          local keys = settings.remap or mappings
          local exec = settings[1]
          local pattern = settings.pattern or nil
          local desc = settings.desc or "<none>"
          local nowait = settings.nowait or false
          local silent = settings.silent or false
          local expr = settings.expr or false
          vim.keymap.set(keys_mode, keys, exec, {
            desc = desc,
            nowait = nowait,
            expr = expr,
            silent = silent,
          })
          if type(pattern) == 'string' and not nil then
            vim.api.nvim_create_autocmd("BufRead", {
              pattern = pattern,
              callback = function()
                vim.keymap.set(keys_mode, keys, exec, {
                  desc = desc,
                  nowait = nowait,
                  expr = expr,
                  silent = silent,
                })
              end
            })
          end
        end
      end
    end
  end
end

return M
