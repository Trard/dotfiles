local map = vim.keymap.set
local execute = vim.fn.execute

-- Exit insert mode with `jk`
map("i", "jk", "<Esc>")
-- Do the same in terminal mode
map("t", "jk", "<C-\\><C-N>")

-- Format
map("n", "F", function() execute("Format") end)

-- Rename
map("n", "rn", function() vim.lsp.buf.rename() end, { noremap = true })

-- Run tests
map("n", "tn", function() execute("TestNearest") end)
map("n", "tf", function() execute("TestFile") end)
map("n", "tl", function() execute("TestLast") end)
