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
			"nvim-treesitter/playground",
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
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

	-- Easy commenting 
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

    -- Formatting
	{
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.config.formatter")
		end,
	},

    -- Autocomplete
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

    -- LSP
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
	"nvim-lua/lsp-status.nvim",

    "simrat39/rust-tools.nvim",
	{
		"saecki/crates.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},

    -- DAP
	"mfussenegger/nvim-dap",

    -- Easy swap args in functions
	"machakann/vim-swap",

	-- Startup time benchmark
	"dstein64/vim-startuptime",

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

	-- Render markdown
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Optimize large files
	"vim-scripts/LargeFile",

	-- Indent line
	{
		"lukas-reineke/indent-blankline.nvim",
		init = function()
			require("plugins.setup.indent_line_setup")
		end,
	},

	-- Fish abbreviations
	"trard/fish_abbr.nvim",

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
