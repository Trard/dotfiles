local lsp_config = require("lspconfig")
local lsp_status = require("plugins.config.lsp_status")

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local capabilities = cmp_capabilities
extend_table(capabilities, lsp_status.capabilities)

lsp_config.sumneko_lua.setup({
	settings = {
		Lua = {
			runtime = {
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
    on_attach = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end,
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
    on_attach = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end,
	capabilities = capabilities,
})

lsp_config.tsserver.setup({
	root_dir = function(fname)
		return lsp_config.util.root_pattern("tsconfig.json")(fname)
			or lsp_config.util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
			-- allow use without root pattern
			or lsp_config.util.path.dirname(fname)
	end,
    on_attach = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end,
	capabilities = capabilities,
})

