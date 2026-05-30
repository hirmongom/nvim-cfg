require("toggleterm").setup {
  -- open_mapping = "<C-Space>t",
  open_mapping = "<leader>t",
  direction = "tab",
  insert_mappings = false,
  terminal_mappings = false,
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-t>", "<cmd>ToggleTerm<CR>", opts)
  vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<CR>", opts)
end

vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
