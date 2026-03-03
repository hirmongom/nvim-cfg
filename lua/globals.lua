local globals = {}

globals.leader = " "
-- To use Ctrl-Space: vim.api.nvim_replace_termcodes([[<C-Space>]], true, true, true)
globals.maxColumns = 100
globals.tabSize = 2

-- Insert a new line after doing a fill
globals.fill_auto_nl = true

return globals
