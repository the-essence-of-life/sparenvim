return {
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("bin.plugins.lsp.lspsaga")
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
			{ "neovim/nvim-lspconfig" },
		},
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		dependencies = {
			-- {"williamboman/mason-lspconfig.nvim", config = true},
			{ "neovim/nvim-lspconfig" },
			{ "glepnir/lspsaga.nvim" },
			-- "jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("bin.plugins.lsp.lsp-settings").mason()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- "neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"amarakon/nvim-cmp-buffer-lines",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("bin.plugins.lsp.cmp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("bin.plugins.lsp.lsp-settings").lspconfig()
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("bin.plugins.lsp.null-ls")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
