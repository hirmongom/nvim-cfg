local globals = require("globals")

local M = {}

----------------------------------------------------------------------------------------------------
-- temporary alternate mode for fill: toggles fill_auto_nl for a single call
function M.alternate_fill(fn)
  return function(...)
    local old = globals.fill_auto_nl
    globals.fill_auto_nl = not old
    local ok, err = pcall(fn, ...)
    globals.fill_auto_nl = old
    if not ok then
      error(err)
    end
  end
end

return M
