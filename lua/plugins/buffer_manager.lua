require("buffer_manager").setup {
  select_menu_item_commands = {
    edit = {
      key = "l",
      command = "edit",
    },
  },
  width = 0.6,
  height = 0.7,
  show_cols = "kbs",
  loop_nav = true,
  order_buffers = "bufnr",
}
