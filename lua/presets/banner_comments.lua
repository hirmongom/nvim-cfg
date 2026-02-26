local globals = require("globals")

local M = {}

local max = globals.maxColumns

local function generate(prefix, fill, suffix)
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

M.by_ft =
{
  c      = generate("/", "*", "/"),
  cpp    = generate("/", "*", "/"),
  h      = generate("/", "*", "/"),
  hpp    = generate("/", "*", "/"),

  python = generate("", "#", ""),
  sh     = generate("", "#", ""),
  lua    = generate("", "-", ""),
}

return M
