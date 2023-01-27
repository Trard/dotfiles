-- Thanks to https://stackoverflow.com/a/69951171
function Alias(input, output)
  vim.api.nvim_command("cabbrev <expr> " .. input .. " " .. "v:lua.abbreviate_or_noop('" .. input .. "', '" .. output .. "')")
end

Alias("W", "w")
Alias("Wq", "wq")
Alias("WQ", "wq")
Alias("wQ", "wq")
Alias("TShi", "TSHighlightCapturesUnderCursor")
