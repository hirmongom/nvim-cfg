-- Autogroups
local groups = {}

groups.formatoptions =
  vim.api.nvim_create_augroup("UserFormatOptions", { clear = true })

-- Load autocmd definitions
require("autocmds/formatoptions")(groups.formatoptions)
