-- Set global leader key for user keymaps
vim.g.mapleader = vim.api.nvim_replace_termcodes([[<C-Space>]], true, true, true)
vim.g.maplocalleader = vim.api.nvim_replace_termcodes([[<C-Space>]], true, true, true)
vim.keymap.set({ "n", "v", "o" }, "<Space>", "<Nop>", { silent = true })

-- Load keymaps
require("keymaps/keymaps")
require("keymaps/nvim-tree")
require("keymaps/buffer_manager")
