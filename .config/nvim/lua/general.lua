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

o.shell = "zsh"


-- Cursor fix after exit
vim.cmd
[[
    augroup change_cursor
        au!
        au ExitPre * :set guicursor=a:ver90
    augroup END
]]

-- vim.opt.clipboard = 'unnamedplus'

-- Some WSL patches
if vim.fn.has("wsl") then
    vim.cmd[[
        let s:clip = '/mnt/c/Windows/System32/clip.exe'
        if executable(s:clip)  
            augroup WSLYank
                autocmd!
                autocmd TextYankPost * if v:event.operator ==# 'y' | call system('cat |' . s:clip, @0) | endif
            augroup END
        endif
    ]]
end
