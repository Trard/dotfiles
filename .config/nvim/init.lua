local fn = vim.fn

-- Helpers
require("helpers")

-- General settings
require("general")

-- Packages
local packer = require("packer")
packer.init({
	compile_path = fn.stdpath("data") .. "/packer_compiled.lua",
})

local use = packer.use

-- Packer itself
use("wbthomason/packer.nvim")

-- Highligth
use {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("plugins.config.treesitter")
	end,
	requires = {
		"p00f/nvim-ts-rainbow",
		"nvim-treesitter/playground",
	},
}

use {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()
	end,
}

use("vim-scripts/LargeFile")

-- Indent line
use {
	"lukas-reineke/indent-blankline.nvim",
	setup = function()
		require("plugins.setup.indent_line_setup")
	end,
}

-- Git
use {
	"sindrets/diffview.nvim",
	config = function()
		require("plugins.config.diffview")
	end,
	requires = "nvim-lua/plenary.nvim",
}

use {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup()
	end,
}

-- Finder
use {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.0",
	config = function()
		require("plugins.config.telescope")
	end,
	requires = { "nvim-lua/plenary.nvim" },
}

-- Testing
use("vim-test/vim-test")

-- Code helpers
use {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
	end,
}

use {
	"mhartington/formatter.nvim",
	config = function()
		require("plugins.config.formatter")
	end,
}

use {
	"hrsh7th/nvim-cmp",
	config = function()
		require("plugins.config.cmp")
	end,
	requires = {
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-nvim-lua",
		"kdheepak/cmp-latex-symbols",
	},
}

-- Startup time benchmark
use("dstein64/vim-startuptime")

-- Custom statusline
require("statusline")

-- Fish abbreviations
use("trard/fish_abbr.nvim")

-- Render markdown
use {
	"iamcco/markdown-preview.nvim",
	run = function()
		vim.fn["mkdp#util#install"]()
	end,
}

-- LSP
require("vim_diagnostics")

use {
	"neovim/nvim-lspconfig",
	config = function()
		require("plugins.config.lsp")
	end,
}

use {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	config = function()
		require("lsp_lines").setup()
	end,
}

-- Deep Ocean Theme
use("/home/trard/dev/tressty/nvim") -- trard/treesty.nvim
vim.cmd([[colorscheme tressty]])
-- Run all config
dofile(fn.stdpath("data") .. "/packer_compiled.lua")


-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
	require("packer").sync()
end

-- Load command aliases and mappings
require("aliases")
require("mappings")
