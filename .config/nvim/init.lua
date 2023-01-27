-- -- Helpers
require("helpers")

-- General settings
require("general")

-- Custom statusline
require("statusline")

-- Load command aliases and mappings
require("aliases")
require("mappings")

-- -- Disable default vim diagnostics
require("vim_diagnostics")
--
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
            "nvim-treesitter/playground"
        },
        event = "BufReadPost",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
        event = "BufReadPost",
	},

	-- Git
	{
		"sindrets/diffview.nvim",
		config = function()
			require("plugins.config.diffview")
		end,
		dependencies = "nvim-lua/plenary.nvim",
        keys = {
            { "dvo", "<cmd>DiffviewOpen<cr>" }
        },
        event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
        event = "BufReadPre"
	},

	-- Easy commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
        event = "VeryLazy",
	},

	-- Formatting
	{
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.config.formatter")
		end,
		lazy = true,
		keys = {
			{ "F", "<cmd>Format<cr>" },
		},
        event = "VeryLazy",
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
		},
        event = "InsertEnter",
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
        event = "BufReadPre",
		keys = {
			{ "rn", vim.lsp.buf.rename, noremap = true },
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
        ft = "toml"
	},

	-- DAP
	"mfussenegger/nvim-dap",

	-- Easy swap args in functions
    {
        "machakann/vim-swap",
        event = "VeryLazy"
    },

	-- Finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"ff",
				function()
					require("telescope.builtin").find_files()
				end,
			},
			{
				"fg",
				function()
					require("telescope.builtin").live_grep()
				end,
			},
			{
				"fo",
				function()
					require("telescope.builtin").live_grep({ grep_open_files = true })
				end,
			},
			{
				"fb",
				function()
					require("telescope.builtin").buffers()
				end,
			},
			{
				"fh",
				function()
					require("telescope.builtin").help_tags()
				end,
			},
		},
	},

	-- Testing
	{
		"vim-test/vim-test",
		keys = {
			{ "tn", "<cmd>TestNearest<cr>" },
			{ "tf", "<cmd>TestFile<cr>" },
			{ "tl", "<cmd>TestLast<cr>" },
		},
	},

	-- Powerfull undo history
	{
		"mbbill/undotree",
		keys = {
			{ "<C-u>", "<cmd>UndotreeToggle<cr>" },
		},
	},

	-- Render markdown
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = "markdown",
	},

	-- Optimize large files
	"vim-scripts/LargeFile",

	-- Indent line
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.config.indent_line")
		end,
	},

	-- Fish abbreviations
    {
        "trard/fish_abbr.nvim",
        event = "VeryLazy",
    },

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
