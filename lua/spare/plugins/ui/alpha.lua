local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	[[                          _]],
	[[   ____  ___  ____ _   __(_)___ ___]],
	[[  / __ \/ _ \/ __ \ | / / / __ `__ \]],
	[[ / / / /  __/ /_/ / |/ / / / / / / /]],
	[[/_/ /_/\___/\____/|___/_/_/ /_/ /_/]],
	[[]],
	[[    A modern and beautiful ide.]],
	[[  <leader>nt  open the file tree]],
	-- [[    <s>]],
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
	dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
	dashboard.button("m", "  Menu", ":Telescope menu<CR>"),
	dashboard.button("q", "→  Quit NVIM", ":qa<CR>"),
}
-- Send config to alpha
alpha.setup(dashboard.opts)
-- alpha.setup(opts)

-- Disable folding on alpha buffer
vim.cmd([[
autocmd FileType alpha setlocal nofoldenable
]])
