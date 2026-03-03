local M = {}

local map = {
  c = "c",
  h = "c",
  cpp = "cpp",
  hpp = "cpp",
  lua = "lua",
  py = "python",
  python = "python",
  sh = "shell",
}

local cache = {}

----------------------------------------------------------------------------------------------------
local function get_extension()
  local name = vim.api.nvim_buf_get_name(0)
  return name:match("^.+%.(.+)$")
end

----------------------------------------------------------------------------------------------------
local function load_language(ext)
  if cache[ext] then
    return cache[ext]
  end

  local ok, mod = pcall(require, "langsys.languages." .. ext)

  if not ok then
    return nil
  end

  cache[ext] = mod
  return mod
end

----------------------------------------------------------------------------------------------------
function M.get()
  local ft = vim.bo.filetype
  local ext = get_extension()

  local key = map[ft] or map[ext] or "_default"

  return load_language(key)
end

----------------------------------------------------------------------------------------------------
M.get_extension = get_extension

----------------------------------------------------------------------------------------------------
return M
