local map = vim.keymap.set

vim.g.mapleader = ","

-- Open the current directory
map("n", "<leader>d", vim.cmd.Ex)

-- Move visual block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Exit insert mode with `jk`
map("i", "jk", "<Esc>")
map("t", "jk", "<C-\\><C-N>")

-- Format
map("n", "F", vim.cmd.Format)

-- Rename
map("n", "rn", vim.lsp.buf.rename, { noremap = true })

-- Fast replace
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Run tests
map("n", "tn", vim.cmd.TestNearest)
map("n", "tf", vim.cmd.TestFile)
map("n", "tl", vim.cmd.TestLast)

-- Undotree
map("n", "<C-u>", vim.cmd.UndotreeToggle)

-- Fix pasting
map("x", "<leader>p", '"_dP')
