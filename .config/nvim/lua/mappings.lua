local map = vim.keymap.set

vim.g.mapleader = ","

-- Exit insert mode with `jk`
map("i", "jk", "<Esc>")
-- Do the same in terminal mode
map("t", "jk", "<C-\\><C-N>")

-- Format
map("n", "F", vim.cmd.Format)

-- Rename
map("n", "rn", vim.lsp.buf.rename, { noremap = true })

-- Run tests
map("n", "tn", vim.cmd.TestNearest)
map("n", "tf", vim.cmd.TestFile)
map("n", "tl", vim.cmd.TestLast)

-- Undotree
map("n", "<C-u>", vim.cmd.UndotreeToggle)
