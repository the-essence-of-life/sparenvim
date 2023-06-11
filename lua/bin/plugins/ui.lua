return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		name = "catppuccin",
		config = function()
			require("bin.plugins.ui.catppuccin")
			local color = colorscheme or "catppuccin"
			vim.cmd.color(color)
		end,
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		keys = {
			{ "<a-,>", "<cmd>bprevious<cr>", mode = "n" },
			{ "<a-.>", "<cmd>bnext<cr>", mode = "n" },
		},
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.opt.laststatus = 2
			require("lualine").setup({
				options = {
					theme = "catppuccin",
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("bin.plugins.ui.indent-blankline")
		end,
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			require("bin.plugins.ui.alpha")
		end,
	},
	{
		"yamatsum/nvim-cursorline",
		config = function()
			require("bin.plugins.ui.cursorline")
		end,
	},
}
