-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
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
                        "fmt", "-",
						"--config",
						"~/.config/taplo/taplo.toml",
					},
                    stdin = true
				}
			end,
		},
	},
})
