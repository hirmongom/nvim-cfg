local keymap = vim.keymap.set

-- Buffers -----------------------------------------------------------------------------------------
keymap(
  "n",
  "<leader><Tab>",
  "<cmd>b#<CR>",
  { desc = "Switch to previously used buffer" }
)

keymap(
  "n",
  "<leader>n",
  "<cmd>bn<CR>",
  { desc = "Switch to next buffer in list" }
)

keymap(
  "n",
  "<leader>p",
  "<cmd>bp<CR>",
  { desc = "Switch to previous buffer in list" }
)

-- Formatting --------------------------------------------------------------------------------------
keymap(
  "n",
  "<leader>t",
  "<cmd>retab<CR>",
  { desc = "Change tab type to current config" }
)

keymap(
  "i",
  "<C-f>",
  function()
    local target = 100
    local col = vim.fn.col(".")
    local char = vim.fn.getcharstr()

    if col > target then
      return
    end

    local count = target - col + 1
    local fill = string.rep(char, count)

    vim.api.nvim_put({ fill }, "c", true, true)
  end,
  {
    desc = "Fill all columns from cursor up to 100 (included) with the given character",
    noremap = true,
    silent = true,
  }
)
