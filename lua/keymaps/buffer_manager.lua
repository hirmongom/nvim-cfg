local keymap = vim.keymap.set

keymap(
  "n",
  "<leader>b",
  function()
    require("buffer_manager.ui").toggle_quick_menu()
  end,
  { desc = "Buffer List" }
)
