return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		keys = {
			{ "<c-n>", "<cmd>NvimTreeToggle<cr>", desc = "NeoTree" },
		},
		config = function()
			require("bin.plugins.tools.nvim-tree")
		end,
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		enabled = false,
		dependencies = {
			"ThePrimeagen/harpoon",
		},
		config = function()
			require("git-worktree").setup({
				change_directory_command = "cd", -- default: "cd",
				update_on_change = true, -- default: true,
				update_on_change_command = "e .", -- default: "e .",
				clearjumps_on_change = true, -- default: true,
				autopush = false, -- default: false,
			})
			local Worktree = require("git-worktree")

			-- op = Operations.Switch, Operations.Create, Operations.Delete
			-- metadata = table of useful values (structure dependent on op)
			--      Switch
			--          path = path you switched to
			--          prev_path = previous worktree path
			--      Create
			--          path = path where worktree created
			--          branch = branch name
			--          upstream = upstream remote name
			--      Delete
			--          path = path where worktree deleted

			Worktree.on_tree_change(function(op, metadata)
				if op == Worktree.Operations.Switch then
					print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
				end
			end)
		end,
	},
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	version = "v2.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	keys = {
	-- 		{ "<c-n>", "<cmd>Neotree<cr>", desc = "NeoTree" },
	-- 	},
	-- 	config = function()
	-- 		require("bin.plugins.tools.neotree")
	-- 	end,
	-- },
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
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
	-- {
	--   'kevinhwang91/nvim-ufo',
	--   -- event = "VeryLazy",
	--   -- enabled = true,
	--   dependencies = 'kevinhwang91/promise-async',
	--   config = function()
	--     require('bin.plugins.tools.ufo')
	--   end
	-- },
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			-- local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				-- configuration goes here, for example:
				-- relculright = true,
				-- segments = {
				--   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
				--   {
				--     sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
				--     click = "v:lua.ScSa"
				--   },
				--   { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
				--   {
				--     sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
				--     click = "v:lua.ScSa"
				--   },
				-- }
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		keys = {
			{ "m", "<cmd>Telescope menu<cr>", mode = "n" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n" },
			{ "<leader>fg", "<cmd>Telescope current_buffer_fuzzy_find<cr>", mode = "n" },
		},
		-- tag = "0.1.1",
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
	-- {
	--   'jonarrien/telescope-cmdline.nvim',
	--   keys = {
	--     { ":", "<cmd>Telescope cmdline<cr>", mode = "n" },
	--   },
	--   dependencies = {
	--     "nvim-telescope/telescope.nvim",
	--   },
	--   config = function()
	--     require("bin.plugins.tools.telescope")
	--     require("telescope").load_extension('cmdline')
	--   end
	-- },
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
		event = "VeryLazy",
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
		ft = "md",
		build = "cd app && npm install",
		config = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	{
		"ixru/nvim-markdown",
		ft = "md",
		config = function()
			require("bin.plugins.tools.markdown")
		end,
	},
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		keys = {
			{ "<a-m>", "<cmd>HopChar2<cr>", desc = "hop move two chars" },
		},
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			-- place this in one of your configuration file(s)
		end,
	},
	{
		"m4xshen/autoclose.nvim",
		event = "VeryLazy",
		config = function()
			require("bin.plugins.tools.autoclose")
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("bin.plugins.tools.spectre")
		end,
	},
	{
		"ziontee113/icon-picker.nvim",
		event = "VeryLazy",
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
		event = "VeryLazy",
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
		"jake-stewart/jfind.nvim",
		keys = {
			{ "<c-f>" },
		},
		config = function()
			require("bin.plugins.tools.jfind")
		end,
	},
	-- {
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	version = "v2.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	--    config = function ()
	--      require('bin.plugins.tools.neotree')
	--    end
	-- },
}
