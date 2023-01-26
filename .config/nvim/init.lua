-- Helpers
require("helpers")

-- General settings
require("general")

-- Custom statusline
require("statusline")

-- Load command aliases and mappings
require("aliases")
require("mappings")

-- Disable default vim diagnostics
require("vim_diagnostics")

-- Packages
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup({
	-- Highlight
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.config.treesitter")
		end,
		dependencies = {
			"p00f/nvim-ts-rainbow",
			"nvim-treesitter/playground",
		},
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	"vim-scripts/LargeFile",

	-- Indent line
	{
		"lukas-reineke/indent-blankline.nvim",
		init = function()
			require("plugins.setup.indent_line_setup")
		end,
	},

	-- Git
	{
		"sindrets/diffview.nvim",
		config = function()
			require("plugins.config.diffview")
		end,
		dependencies = "nvim-lua/plenary.nvim",
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		config = function()
			require("plugins.config.telescope")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Testing
	"vim-test/vim-test",

	-- Powerfull undo history
	"mbbill/undotree",

	-- Code helpers
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.config.formatter")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.config.cmp")
		end,
		dependencies = {
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-nvim-lua",
			"kdheepak/cmp-latex-symbols",
		},
	},

	"simrat39/rust-tools.nvim",

	"machakann/vim-swap",

	{
		"saecki/crates.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},
	-- Startup time benchmark
	"dstein64/vim-startuptime",

	-- Fish abbreviations
	"trard/fish_abbr.nvim",

	-- Render markdown
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- LSP & DAP

	"nvim-lua/lsp-status.nvim",

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.config.lsp")
		end,
		dependencies = {
			"nvim-lua/lsp-status.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
	},

	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	},

	"mfussenegger/nvim-dap",

	-- Tressty Theme
	{
		dir = "/home/trard/dev/tressty/nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tressty]])
		end,
	},
})

