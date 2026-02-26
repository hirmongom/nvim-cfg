local globals = require("globals")
local presets = require("presets.banner_comments")

local M = {}

local function get_ft()
  return vim.bo.filetype
end

local function insert(fill)
  if not fill then return end

  local row       = vim.fn.line(".")
  local last_line = vim.api.nvim_buf_line_count(0)

  -- insert at cursor
  vim.api.nvim_put({ fill }, "c", true, true)

  if row < last_line then
    -- move to existing next line
    vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
  else
    -- create new line and move cursor to it (equivalent to <CR>)
    vim.api.nvim_put({ "" }, "l", true, true)
  end
end

function M.char()
  local col = vim.fn.col(".")
  local max = globals.maxColumns

  if col > max then return end

  local char = vim.fn.getcharstr()
  insert(string.rep(char, max - col + 1))
end

function M.suffix()
  local col = vim.fn.col(".")
  local ft  = get_ft()

  local preset = presets.by_ft[ft]
  if not preset then return end

  insert(preset.suffix[col])
end

function M.full()
  local ft = get_ft()

  local preset = presets.by_ft[ft]
  if not preset then return end

  insert(preset.full)
end

return M
