return {
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	lazy = false,
	-- 	keys = function()
	-- 		-- return {
	-- 		-- 	{ "<leader>nt", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
	-- 		-- }
	-- 		return require("bin.config.keymaps").tree
	-- 	end,
	-- 	config = function()
	-- 		require("bin.plugins.tools.nvim-tree")
	-- 	end,
	-- },
	{
		"sindrets/diffview.nvim",
		dependencies = {
			"jacobsimpson/nvim-mercurial",
		},
		event = "VeryLazy",
		config = function()
			require("diffview").setup({
				file_panel = {
					win_config = {
						width = 20,
					},
				},
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = function()
			return require("bin.config.keymaps").neotree
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("bin.plugins.tools.neotree")
		end,
	},
	{
		"terryma/vim-multiple-cursors",
	},
	{
		"numToStr/Comment.nvim",
		keys = function()
			return require("bin.config.keymaps").comment
		end,
		config = true,
	},
	{
		"tanvirtin/vgit.nvim",
		enabled = false,
		cmd = {
			"VGit setup",
			"VGit toggle_diff_preference",
			"VGit toggle_live_gutter",
			"VGit toggle_live_blame",
			"VGit toggle_authorship_code_lens",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.o.updatetime = 300
			vim.o.incsearch = false
			vim.wo.signcolumn = "yes"
			require("bin.plugins.tools.vgit")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		-- keys = {
		-- 	{ "m", "<cmd>Telescope menu<cr>", mode = "n" },
		-- 	{ "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n" },
		-- 	{ "<leader>fg", "<cmd>Telescope current_buffer_fuzzy_find<cr>", mode = "n" },
		-- },
		-- tag = "0.1.1",
		keys = function()
			return require("bin.config.keymaps").telescope
		end,
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"octarect/telescope-menu.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			-- "LinArcX/telescope-command-palette.nvim",
			-- "tsakirist/telescope-lazy.nvim",
			{
				"nvim-telescope/telescope-frecency.nvim",
				dependencies = { "kkharji/sqlite.lua" },
			},
		},
		config = function()
			require("bin.plugins.tools.telescope")
			require("telescope").load_extension("menu")
			require("telescope").load_extension("frecency")
			require("telescope").load_extension("file_browser")
			-- require("telescope").load_extension("command_palette")
			-- require("telescope").load_extension "lazy"
			vim.keymap.set("n", "<s-t>", "<cmd>Telescope<cr>")
			-- local builtin = require("telescope.builtin")
			-- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			-- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		event = "InsertEnter",
		enabled = false,
		config = function()
			require("bin.plugins.tools.ccc")
		end,
	},
	{
		"stevearc/overseer.nvim",
		cmd = {
			"OverseerRun",
			"OverseerToggle",
			"OverseerQuickAction",
			"OverseerTaskAction",
		},
		config = function()
			require("bin.plugins.tools.overseer")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		version = "*",
		config = function()
			require("bin.plugins.tools.toggleterm")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "UIEnter",
		config = true,
	},

	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bin.plugins.tools.trouble")
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("bin.plugins.tools.todo-comments")
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		event = "BufEnter *.md",
		-- ft = "md",
		build = "cd app && npm install",
		config = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	{
		"ixru/nvim-markdown",
		event = "BufEnter *.md",
		-- ft = "md",
		config = function()
			require("bin.plugins.tools.markdown")
		end,
	},
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		keys = function()
			return require("bin.config.keymaps").hop
		end,
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			-- place this in one of your configuration file(s)
		end,
	},
	{
		"m4xshen/autoclose.nvim",
		event = "InsertEnter",
		config = function()
			require("bin.plugins.tools.autoclose")
		end,
	},
	-- {
	-- 	"nvim-pack/nvim-spectre",
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("bin.plugins.tools.spectre")
	-- 	end,
	-- },
	{
		"ziontee113/icon-picker.nvim",
		cmd = {
			"IconPickerInsert",
			"IconPickerYank",
			"IconPickerNormal",
		},
		dependencies = {
			"stevearc/dressing.nvim",
		},
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true,
			})
		end,
	},
	{
		"folke/which-key.nvim",
		-- event = "VeryLazy",
		keys = function()
			return require("bin.config.keymaps").which_key
		end,
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				window = {
					border = "rounded", -- none, single, double, shadow
					position = "buttom", -- bottom, top
					margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
					padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
					winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
					zindex = 1000, -- positive value to position WhichKey above other floating windows.
				},
				layout = {
					height = { min = 6, max = 6 }, -- min and max height of the columns
					width = { min = 20, max = 50 }, -- min and max width of the columns
					spacing = 3, -- spacing between columns
					align = "left", -- align columns left, center or right
				},
			})
		end,
	},
	{
		"folke/edgy.nvim",
		event = "WinNew",
		init = function()
			vim.opt.laststatus = 3
			vim.opt.splitkeep = "screen"
		end,
		opts = {
			animate = {
				enabled = true,
				fps = 100, -- frames per second
				cps = 120, -- cells per second
				on_begin = function()
					vim.g.minianimate_disable = true
				end,
				on_end = function()
					vim.g.minianimate_disable = false
				end,
				-- Spinner for pinned views that are loading.
				-- if you have noice.nvim installed, you can use any spinner from it, like:
				-- spinner = require("noice.util.spinners").spinners.circleFull,
				spinner = {
					frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
					interval = 80,
				},
			},
			bottom = {
				-- toggleterm / lazyterm at the bottom with a height of 40% of the screen
				{
					ft = "toggleterm",
					size = { height = 0.3 },
					-- exclude floating windows
					filter = function(buf, win)
						return vim.api.nvim_win_get_config(win).relative == ""
					end,
				},
				{
					ft = "Trouble",
					title = " Lsp Quickfix",
				},
				{ ft = "qf", title = "QuickFix" },
				{
					ft = "help",
					size = { height = 0.4 },
					-- only show help buffers
					filter = function(buf)
						return vim.bo[buf].buftype == "help"
					end,
				},
			},
			left = {
				-- {
				-- 	ft = "NvimTree",
				-- 	title = "NvimTree",
				-- 	open = "NvimTreeToggle",
				-- },
			},
		},
	},
}
