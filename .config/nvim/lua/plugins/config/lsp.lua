local lsp_config = require("lspconfig")
local lsp_status = require("plugins.config.lsp_status")

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local function extend(table, other_table)
    return vim.tbl_extend('keep', table, other_table)
end

local capabilities = cmp_capabilities
extend(capabilities, lsp_status.capabilities)

-- https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
lsp_config.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			cargo = {
				features = "all",
			},
			completion = {
				autoimport = {
					enable = true,
				},
			},
			checkOnSave = {
				command = "clippy",
			},
			imports = {
				granularity = {
					group = "crate",
				},
				prefix = "by_crate",
			},
		},
	},
	capabilities = capabilities,
})

lsp_config.sumneko_lua.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	capabilities = capabilities,
})

lsp_config.pyright.setup({
	python = {
		analysis = {
			autoSearchPaths = true,
			diagnosticMode = "workspace",
			useLibraryCodeForTypes = true,
		},
	},
	capabilities = capabilities,
})

lsp_config.tsserver.setup({
	capabilities = capabilities,
})
