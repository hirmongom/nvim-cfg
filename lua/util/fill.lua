local globals = require("globals")
local resolver = require("langsys.resolver")

local M = {}

----------------------------------------------------------------------------------------------------
local function insert(fill)
  if not fill then return end

  local row       = vim.fn.line(".")
  local last_line = vim.api.nvim_buf_line_count(0)

  -- insert at cursor
  vim.api.nvim_put({ fill }, "c", true, true)

  if globals.fill_auto_nl or row == last_line then
    -- create new line
    vim.api.nvim_put({ "" }, "l", true, false) -- follow = false
  end

  -- move to existing next line
  vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
end

----------------------------------------------------------------------------------------------------
function M.char()
  local col = vim.fn.col(".")
  local max = globals.maxColumns

  if col > max then return end

  local char = vim.fn.getcharstr()
  insert(string.rep(char, max - col + 1))
end

----------------------------------------------------------------------------------------------------
function M.suffix()
  local language = resolver.get()
  if not language then return end

  local col = vim.fn.col(".")

  insert(language.comment.banner.suffix[col])
end

----------------------------------------------------------------------------------------------------
function M.full()
  local language = resolver.get()
  if not language then return end

  insert(language.comment.banner.full)
end

----------------------------------------------------------------------------------------------------
return M
