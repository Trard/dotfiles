-- Thanks to https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html

local filename = require("statusline.filename");
local git = require("statusline.git");
local encoding = require("statusline.encoding");
local position = require("statusline.position");

Statusline = {}

Statusline.active = function()
  return table.concat {
    "%#Statusline#",
    "%#Normal# ",
    filename(),
    git(),
    "%=", -- Right
    "%#Normal# ",
    position(),
    encoding(),
  }
end

function Statusline.inactive()
  return " %F"
end

function Statusline.short()
  return "%#StatusLineNC#   NvimTree"
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
