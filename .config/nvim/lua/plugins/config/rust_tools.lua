local lsp_status = require("plugins.config.lsp_status")

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local capabilities = cmp_capabilities
extend_table(capabilities, lsp_status.capabilities)

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
