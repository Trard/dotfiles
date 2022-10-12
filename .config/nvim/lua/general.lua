local o = vim.o

-- Numbers
o.number = true
o.relativenumber = true

-- Tabs
o.expandtab = true
o.smartindent = true
o.smarttab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4       

vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

-- Cursor fix after exit
vim.cmd
[[
    augroup change_cursor
        au!
        au ExitPre * :set guicursor=a:ver90
    augroup END
]]

-- Some WSL patches
if vim.fn.has("wsl") then
    -- Allow copy
    vim.g.clipboard = {
        name = "clip.exe (Copy Only)",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe"
        },
        paste = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe"
        },
        cache_enabled = true
    }
end

