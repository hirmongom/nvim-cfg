local M = {}

local globals = require("globals")
local max = globals.maxColumns

----------------------------------------------------------------------------------------------------
function M.generate(prefix, fill, suffix)
  local full =
    prefix ..
    string.rep(fill, max - #prefix - #suffix) ..
    suffix

  local suffix_tbl = {}

  for col = 1, max do
    local count =
      max - col - #suffix + 1

    if count < 0 then
      suffix_tbl[col] = suffix
    else
      suffix_tbl[col] =
        string.rep(fill, count) .. suffix
    end
  end

  return
  {
    full   = full,
    suffix = suffix_tbl,
  }
end

----------------------------------------------------------------------------------------------------
return M
