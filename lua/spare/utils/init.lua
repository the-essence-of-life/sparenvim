---@class M
---@module 'spare.utils.index'
local Index = require("spare.utils.index")
---@module 'spare.utils.builtin'
local builtin = require("spare.utils.builtin")

---@type function
local echo = function(str)
  vim.cmd("redraw")
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end
local M = {}
---@type function
function M.setup(config)
  local Cfg = require("spare.utils.tables"):set(config):get()
  if Cfg.options then
    if Cfg.options.enabled then
      builtin.options(Cfg.options.set, "options")
      builtin.options(Cfg.options.global, "global_var")
    end
  end
  if Cfg.keymaps then
    if Cfg.keymaps.enabled then
      builtin.keymaps(Cfg.keymaps.set.basic)
      -- if type(Cfg.keymaps.set.lsp) == "table" then
      --   for _, lsp_mapping in ipairs(Cfg.keymaps.set.lsp) do
      --     vim.api.nvim_create_autocmd("LspAttach", {
      --       group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      --       callback = function()
      --         local mode = lsp_mapping[1]
      --         local keys = lsp_mapping[2]
      --         local exec = lsp_mapping[3]
      --         local desc = lsp_mapping[4] or "<none>"
      --         local nowait = lsp_mapping.nowait
      --         local silent = lsp_mapping.silent
      --         local expr = lsp_mapping.expr
      --         vim.keymap.set(mode, keys, exec, {
      --           desc = desc,
      --           nowait = nowait,
      --           expr = expr or false,
      --           silent = silent or false,
      --         })
      --       end
      --     })
      --   end
      -- end
    end
  end
  if Cfg.autocmds then
    if Cfg.autocmds.enabled then
      if Cfg.autocmds.lastplace then
        Index.lastplace()
      end
      if Cfg.autocmds.directory then
        Index.directory()
      end
      if Cfg.autocmds.based_term_support then
        Index.terminal()
      end
      if type(Cfg.autocmds.set) == "table" then
        for _, autocmds in ipairs(Cfg.autocmds.set) do
          local first = autocmds[1]
          local second = autocmds[2]
          local third = autocmds[3]
          local fourth = autocmds[4]
          if type(third) == "string" then
            vim.api.nvim_create_autocmd(first or "VimEnter", {
              pattern = second,
              desc = fourth,
              command = third
            })
          elseif type(third) == "function" then
            vim.api.nvim_create_autocmd(first or "VimEnter", {
              pattern = second,
              desc = fourth,
              callback = function()
                third()
              end
            })
          end
        end
      end
    end
  end
  if type(Cfg.modules) == "table" then
    for _, module in ipairs(Cfg.modules) do
      local ok = pcall(require, module)
      if ok then
        require(module)
      end
    end
  end
  if Cfg.plugin.enabled then
    if type(Cfg.plugin.set) == "table" then
      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not vim.loop.fs_stat(lazypath) then
        echo(" Installing the lazy.nvim to ~/.local/share/nvim/lazy/lazy.nvim...")
        vim.fn.system({
          "git",
          "clone",
          "--filter=blob:none",
          "https://github.com/folke/lazy.nvim.git",
          "--branch=stable", -- latest stable release
          lazypath,
        })
      end
      vim.opt.rtp:prepend(lazypath)
      ---@module 'lazy'
      ---@type function
      require("lazy").setup(Cfg.plugin.set)
    elseif type(Cfg.plugin.set) == "function" then
      ---@type function
      Cfg.plugin.set()
    elseif not Cfg.plugin.set then
      return
    end
    if type(Cfg.plugin.colorscheme) == "string" then
      local color = color or Cfg.plugin.colorscheme
      vim.cmd("colorscheme " .. color .. "")
    elseif type(Cfg.plugin.colorscheme) == "function" then
      ---@type function
      Cfg.plugin.colorscheme()
    end
  end
end

return M
