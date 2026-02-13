local keymap = vim.keymap.set

-- Telescope ---------------------------------------------------------------------------------------
local builtin = require("telescope.builtin")
keymap(
  "n",
  "<leader>ff",
  builtin.find_files,
  { desc = "Telescope find files" }
)

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
