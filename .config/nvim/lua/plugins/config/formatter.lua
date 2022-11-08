-- Utilities for creating configurations
local util = require("formatter.util")

local configured_filetypes = {
	rust = {
		function()
			return {
				exe = "rustfmt",
				stdin = true,
			}
		end,
	},
	lua = {
		function()
			return {
				exe = "stylua",
				args = {
					"--search-parent-directories",
					"--stdin-filepath",
					util.escape_path(util.get_current_buffer_file_path()),
					"--",
					"-",
				},
				stdin = true,
			}
		end,
	},
	toml = {
		function()
			return {
				exe = "taplo",
				args = {
					"fmt",
					"-",
					"--config",
					"~/.config/taplo/taplo.toml",
				},
				stdin = true,
			}
		end,
	},
}

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = merge_tables(configured_filetypes, {
		["*"] = {
			function()
				local current_filetype = vim.bo.filetype

				if configured_filetypes[current_filetype] ~= nil then
					return nil
				end

				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
	}),
})
