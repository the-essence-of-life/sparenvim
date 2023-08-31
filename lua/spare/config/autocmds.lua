-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = {
--     "lua"
--   },
--   callback = function ()
--     vim.lsp.buf.format({ async = true })
--   end
-- })

local M = {}

M.directory = function()
  -- WARN:this code search for internet.
  vim.api.nvim_create_user_command("MakeDirectory", function()
    ---@diagnostic disable-next-line: missing-parameter
    local path = vim.fn.expand("%")
    local dir = vim.fn.fnamemodify(path, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    else
      vim.notify("Directory already exists", "WARN", { title = " Directory Exists" })
    end
  end, { desc = "Create directory if it doesn't exist" })
end

M.lastplace = function()
  -- WARN:this code search for internet.
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
      if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
        vim.fn.setpos(".", vim.fn.getpos("'\""))
        vim.cmd("silent! foldopen")
      end
    end,
  })
end

M.workspace = function()
  -- vim.api.nvim_create_user_command("AddWorkspace", function()
  --   local path = "~/workspace/workspace/"
  --   local dir = vim.fn.fnamemodify(path, ":p:h")
  --   if vim.fn.isdirectory(dir) == 0 then
  --     vim.fn.system("mkdir", "~/workspace/workspace/")
  --   end
  -- end, { desc = "Add a workspace directory" } )
end

M.user = function ()
  -- local temp_test = vim.fn.input("Test:")
end

return M
