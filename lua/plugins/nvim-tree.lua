-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup
require("nvim-tree").setup {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
-- Keymaps
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close directory"))
    vim.keymap.set("n", "r", api.tree.reload, opts("Refresh"))
    vim.keymap.set("n", "n", api.fs.create, opts("New file/dir"))
    vim.keymap.set("n", "f", api.fs.rename, opts("Rename node"))
    vim.keymap.set("n", "d", api.fs.remove, opts("Remove node"))
    vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy node into tree.clipboard"))
    vim.keymap.set("n", "x", api.fs.cut, opts("Cut node into tree.clipboard"))
    vim.keymap.set("n", "v", api.fs.paste, opts("Paste node from tree.clipboard"))
    vim.keymap.set("n", "q", api.fs.clear_clipboard, opts("Clear tree.clipboard"))
    vim.keymap.set("n", "p", api.fs.print_clipboard, opts("Print tree.clipboard"))
    vim.keymap.set("n", "g", api.commands.get, opts("Retrieve all commands"))
  end,
}

