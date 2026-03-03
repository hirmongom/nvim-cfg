require("toggleterm").setup {
  -- open_mapping = "<C-Space>t",
  open_mapping = "<leader>t",
  direction = "tab",
  insert_mappings = false,
  terminal_mappings = false,

  on_open = function(term)
    vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], { 
      buffer = term.bufnr, 
      desc = "Return to Normal mode" })
  end,
}
