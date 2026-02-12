local keymap = vim.keymap.set

-- Buffer Manager ----------------------------------------------------------------------------------
keymap(
  "n",
  "<leader>b",
  function()
    require("buffer_manager.ui").toggle_quick_menu()
  end,
  { desc = "Buffer List" }
)

-- Nvim Tree ---------------------------------------------------------------------------------------
keymap(
  "n",
  "<leader>e",
  "<cmd>NvimTreeToggle<CR>",
  { desc = "Toggle file explorer" }
)
