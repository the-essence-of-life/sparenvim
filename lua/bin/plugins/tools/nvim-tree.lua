vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	renderer = {
		group_empty = true,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
	},
	filters = {
		dotfiles = true,
	},
	git = {
		enable = false,
	},
	view = {
		-- relativenumber = true,
		-- float = {
		-- 	enable = true,
		-- 	quit_on_focus_loss = true,
		-- 	open_win_config = {
		-- 		relative = "editor",
		-- 		border = "rounded",
		-- width = 10,
		-- 		height = 25,
		-- 		row = 1,
		-- 		col = 1,
		-- 	},
		-- },
	},
})
