local map = vim.keymap.set

-- Exit insert mode with `jk`
map("i", "jk", "<Esc>")
-- Do the same in terminal mode
map("t", "jk", "<C-\\><C-N>")

-- Format
map("n", "F", function() vim.fn.execute("Format") end)
map("n", "rn", function() vim.lsp.buf.rename() end, { noremap = true })
