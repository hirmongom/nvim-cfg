local M = {}

M.print = {}
M.print.resolver = {}

----------------------------------------------------------------------------------------------------
local resolver = require("langsys/resolver")

----------------------------------------------------------------------------------------------------
M.print.ft = function()
  print(vim.bo.filetype)
end

----------------------------------------------------------------------------------------------------
M.print.resolver.lang = function()
  local lang = resolver.get()

  if not lang then
    print("No language resolved")
    return
  end

  print(lang.name or "Language has no name field")
end

----------------------------------------------------------------------------------------------------
M.print.resolver.ext = function()
  print(resolver.get_extension())
end

----------------------------------------------------------------------------------------------------
return M
