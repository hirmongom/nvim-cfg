-- nvim-tree keymaps -------------------------------------------------------------------------------
local keymap = vim.keymap.set

keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>",
  { desc = "Toggle file explorer" })
