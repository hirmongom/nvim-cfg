-- Set global leader key for user keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v", "o" }, "<Space>", "<Nop>", { silent = true })

-- Load keymaps
require("keymaps/keymaps")
require("keymaps/tree")
