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

-- Fast replace
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Fix pasting
map("x", "<leader>p", '"_dP')
