local lsp_status = require("lsp-status")

lsp_status.config({
    status_symbol = "",
    diagnostics = false
})

lsp_status.register_progress()

return lsp_status
