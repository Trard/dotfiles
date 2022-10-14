require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "cpp", "rust", "lua", "python", "javascript", "json", "toml" },

	auto_install = true,

	highlight = {
		enable = true,
		disable = { "javascript" },
	},

	rainbow = {
		enable = true,
		extended_mode = true,

		colors = {
            "#89DDFF",
		},
	},
})
