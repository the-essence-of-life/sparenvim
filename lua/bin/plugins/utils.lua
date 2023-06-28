return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "UIEnter",
		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
			"windwp/nvim-ts-autotag",
		},
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("bin.plugins.utils.treesitter")
			-- require("nvim-ts-autotag").setup()
		end,
	},
	-- {
	-- 	"windwp/nvim-autopairs",
	-- 	config = function()
	-- 		require("bin.plugins.utils.autopairs")
	-- 	end,
	-- },
	{
		-- "folke/noice.nvim",
		"folke/noice.nvim",
		config = function()
			require("bin.plugins.utils.noice")
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"folke/persistence.nvim",
		event = "VeryLazy", -- this will only start session saving when an actual file was opened
		-- module = "persistence",
		config = function()
			require("bin.plugins.utils.persistence")
		end,
	},
	-- keys = {
	--   { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", mode = "n", desc = "Undotree Toggle" }
	-- },
	-- },
	-- {
	-- 	"VonHeikemen/fine-cmdline.nvim",
	-- 	keys = {
	-- { ":", mode = "n" },
	-- },
	-- dependencies = {
	-- 	{ "MunifTanjim/nui.nvim" },
	-- },
	-- config = function()
	-- 	require("bin.plugins.utils.fine-cmdline")
	-- require("bin.plugins.utils.nui")
	-- 	end,
	-- },
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("bin.plugins.utils.harpoon")
		end,
	},
	-- { dir = "~/workspace/lazy.nvim" },
}
