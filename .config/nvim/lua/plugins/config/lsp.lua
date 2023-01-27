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

local rt = require("rust-tools")

rt.setup({
	server = {
		-- https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
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
					extraArgs = {
						"--",
						"-W",
						"clippy::all",
						"-W",
						"clippy::pedantic",
						"-W",
						"clippy::nursery",
					},
				},
				imports = {
					granularity = {
						group = "crate",
					},
					prefix = "by_crate",
				},
			},
		},
		on_attach = function(client, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

            -- https://www.reddit.com/r/neovim/comments/10bx4vi/rusttools_breaks_treesitter_highlighting/
			client.server_capabilities.semanticTokensProvider = nil
		end,
		capabilities = capabilities,
	},
})
