local health = {
  start = vim.health.start or vim.health.report_start,
  info = vim.health.info or vim.health.report_info,
  ok = vim.health.ok or vim.health.report_ok,
  warn = vim.health.warn or vim.health.report_warn,
  error = vim.health.error or vim.health.report_error,
}

local M = {}

function M.check()
  -- logo
  health.info([[   _________  ____ _________]])
  health.info([[  / ___/ __ \/ __ `/ ___/ _ \]])
  health.info([[ (__  ) /_/ / /_/ / /  /  __/]])
  health.info([[/____/ .___/\__,_/_/   \___/]])
  health.info([[    /_/]])
  if vim.fn.has("nvim-0.9.5") == 1 then
    health.ok("Using Neovim >= 0.9.5")
  else
    health.warn("Your neovim version is too old.",
      "Try to exec `<your-system-package-manager> update neovim` in your terminal.")
  end
  health.start("Nerd Font Support")
  health.info("There are three signs in the line:")
  health.info("     ")
  health.info("If you see a plus,a box and a keyboard,explain that your terminal supports nerdfont.")
  health.info("If you want to download nerdfont,you can go out for the link:`https://www.nerdfonts.com/font-downloads`")
  if vim.fn.has("termux") then
    health.info("Tips:Termux user can put font into `~/.termux/font.ttf`")
  end

  health.start("Dependencies Check List:")
  if vim.fn.executable("git") == 1 then
    health.ok("git installed.    #plugins download")
  else
    health.error("Install git?", "Download the binary and add it for the $PATH.")
  end
  local de_basic = {
    rg = "Ripgrep",
    fd = "Find-Files",
  }
  for dep, name in pairs(de_basic) do
    if vim.fn.executable(dep) == 1 then
      health.ok(name .. " installed.    #Basic")
    else
      health.warn("Invaild " .. dep .. ".", "Download the binary and add it for the $PATH.")
    end
  end
  local de_lsp = { "node", "lua-language-server" }
  for _, de_lsp_check in ipairs(de_lsp) do
    if vim.fn.executable(de_lsp_check) == 1 then
      health.ok(de_lsp_check .. " installed.    #LSP")
    else
      health.warn('Invaild' .. de_lsp_check .. '? Your language server cannot run correctly.',
        'Download the binary and add it for the $PATH.')
    end
  end
end

return M
