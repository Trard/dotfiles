vim.diagnostic.config({
	virtual_text = false,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false,
	signs = false,
	severity_sort = true,
})
