-- Autogroups
local groups = {}

groups.formatoptions =
  vim.api.nvim_create_augroup("UserFormatOptions", { clear = true })

groups.touchpad =
  vim.api.nvim_create_augroup("Touchpad", { clear = true })

groups.sessioncontrol =
  vim.api.nvim_create_augroup("SessionControl", { clear = true })

-- Load autocmd definitions
require("autocmds/formatoptions")(groups.formatoptions)

-- Load touchpad triggers
require("autocmds/touchpad")(groups.touchpad)

-- Load empty buffer prevention
require("autocmds/noemptybuffer")(groups.sessioncontrol)
