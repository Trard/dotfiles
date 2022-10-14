local lspconfig = require("lspconfig")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false,
	signs = false,
	severity_sort = true,
})

vim.diagnostic.config({
	virtual_text = false,
})

local function capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	return require("cmp_nvim_lsp").update_capabilities(capabilities)
end

lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			completion = {
				autoimport = {
					enable = true,
				},
			},
			checkOnSave = {
				command = "clippy",
			},
			assist = {
				importMergeBehaviour = "crate",
				importPrefix = "by_crate",
			},
		},
	},
	capabilities = capabilities(),
})
