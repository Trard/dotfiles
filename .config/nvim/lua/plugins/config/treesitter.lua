require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "cpp", "rust", "lua", "python", "javascript", "json", "toml", "query" },

	auto_install = true,

	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 200 * 1024 -- 200 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},

	rainbow = {
		enable = true,
		extended_mode = true,

		colors = {
			"#89DDFF",
		},
	},

	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})
