local keymap = vim.keymap.set
local globals = require("globals")
local wrappers = require("keymaps.wrappers")

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

-- Highlights --------------------------------------------------------------------------------------
keymap(
  "n",
  "<leader>h",
  "<cmd>nohlsearch<CR>",
  { desc = "Stop highlights from <hlsearch>" }
)

-- Formatting --------------------------------------------------------------------------------------
keymap(
  "n",
  "<leader>t",
  "<cmd>retab<CR>",
  { desc = "Change tab type to current config" }
)

-- Fill --------------------------------------------------------------------------------------------
local fill = require("util.fill")
keymap(
  "i",
  "<C-f>f",
  fill.full,
  { desc = "Insert full banner comment based on filetype preset, filling "
    .. "from column 1 to maxColumns (included)" }
)

keymap(
  "i",
  "<C-f>s",
  fill.suffix,
  { desc = "Insert banner comment suffix based on filetype preset, filling from "
    .. "cursor position to maxColumns (included)" }
)

keymap(
  "i",
  "<C-f>c",
  fill.char,
  { desc = "Fill from cursor position to maxColumns (included) using a typed "
    .. "custom character" }
)

keymap(
  "i",
  "<C-f><C-f>",
  wrappers.alternate_fill(fill.full),
  { desc = "Insert full banner comment (alternate mode: temporary toggle of fill_auto_nl)" }
)

keymap(
  "i",
  "<C-f><C-s>",
  wrappers.alternate_fill(fill.suffix),
  { desc = "Insert banner suffix (alternate mode: temporary toggle of fill_auto_nl)" }
)

keymap(
  "i",
  "<C-f><C-c>",
  wrappers.alternate_fill(fill.char),
  { desc = "Fill from cursor using a custom char (alternate mode: temporary toggle of "
    .. "fill_auto_nl)" }
)
