-- Title -------------------------------------------------------------------------------------------
-- Display current working directory as title (if terminal supports it)
vim.o.title = true
vim.o.titlestring = "%{getcwd()}"

-- Line numbers ------------------------------------------------------------------------------------
-- Enable display of absolute line numbers
vim.o.number = true
-- Enable relative line numbering for vertical navigation
vim.o.relativenumber = true

-- Cursor ------------------------------------------------------------------------------------------
-- Hightlight the line under the cursor
vim.o.cursorline = true

-- Scroll ------------------------------------------------------------------------------------------
-- Keep a minimum number of context lines above and below the cursor
vim.o.scrolloff = 2

-- Indentation -------------------------------------------------------------------------------------
-- Control whether indentation uses tabs or spaces (true for spaces)
vim.o.expandtab = true
-- Define how wide a tab character is rendered on screen
vim.o.tabstop = require("globals").tabSize

-- Wrapping ----------------------------------------------------------------------------------------
-- Control whether long lines are visually wrapped on screen
vim.o.wrap = true
-- Wrapped line repeats indent
vim.o.breakindent = true
-- Add extra spaces for wrapped indented lines
vim.o.breakindentopt = "shift:0"
-- String to use at the start of wrapped lines
vim.o.showbreak = "↪ "

-- Visual Guides -----------------------------------------------------------------------------------
-- Display a visual guide at column(s)
vim.o.colorcolumn = (require("globals").maxColumns + 1) .. ""

-- Other -------------------------------------------------------------------------------------------
-- Enable 24-bit colour
vim.opt.termguicolors = true
