local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-l>"] = actions.select_default,
      },
      n = {
        ["l"] = actions.select_default,
      },
    },
  },
}
