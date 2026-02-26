local globals = require("globals")
-- Set global leader key for user keymaps
vim.g.mapleader = globals.leader
vim.g.maplocalleader = globals.leader--vim.api.nvim_replace_termcodes([[<C-Space>]], true, true, true)
vim.keymap.set({ "n", "v", "o" }, "<Space>", "<Nop>", { silent = true })

-- Load keymaps
require("keymaps/keymaps")
require("keymaps/plugins")
