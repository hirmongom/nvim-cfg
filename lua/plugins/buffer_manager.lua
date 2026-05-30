require("buffer_manager").setup {
  select_menu_item_commands = {
    edit = {
      key = "l",
      command = "edit",
    },
    delete = {
      key = "d",
      command = "bd",
    },
    wipe = {
      key = "w",
      command = "bw",
    }
  },
  width = 0.6,
  height = 0.7,
  show_cols = "kbs", -- "numbers", "kbs", "both"
  loop_nav = true,
  order_buffers = "bufnr",
  toggle_keybindings = { "b", "q", "<ESC>" },

  format_function = function(buf)
    -- window width of the floating window
    local win_id = vim.api.nvim_get_current_win()
    local width = vim.api.nvim_win_get_width(win_id)
    local config = require("buffer_manager").get_config()
    local show_cols = config.show_cols
    local bufnr = vim.fn.bufnr(buf, false)
    local cwd = vim.loop.cwd()

    -- only with "kbs" option
    if not show_cols == "kbs" then
      return buf
    end

    -- full path
    if buf == "" then
      return "[No Name]"
    end

    -- split path + filename
    local filename = vim.fn.fnamemodify(buf, ":t")
    local rel_path = buf:sub(#cwd + 1)
    local path = vim.fn.fnamemodify(rel_path, ":h") .. "/  b#" .. bufnr

    -- avoid trailing "."
    if path == "." then
      path = ""
    end

    -- compute spacing
    local fname_len = vim.fn.strdisplaywidth(filename)
    local path_len = vim.fn.strdisplaywidth(path)

    -- available space between path and filename
    local padding = width - fname_len - path_len - 3
    if padding < 1 then
      padding = 1
    end
    
    return filename .. string.rep(" ", padding) .. path
  end
}
