function _G.executable(command)
	return vim.fn.executable(command) ~= 0
end

function _G.abbreviate_or_noop(input, output)
  local cmdtype = vim.fn.getcmdtype()
  local cmdline = vim.fn.getcmdline()

  if (cmdtype == ":" and cmdline == input) then
    return output
  else
    return input
  end
end

function _G.augroup(name, opts)
	if opts == nil then
		opts = {}
	end
	return vim.api.nvim_create_augroup(name, opts)
end
_G.autocmd = vim.api.nvim_create_autocmd

function _G.merge_tables(...)
    local tables = {...}

    local first_table = table.remove(tables, 1)

    for _, current_table in pairs(tables) do
        for k,v in pairs(current_table) do first_table[k] = v end
    end

    return first_table
end

