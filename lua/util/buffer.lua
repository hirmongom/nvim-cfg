local M = {}

----------------------------------------------------------------------------------------------------
M.jump = function()
  -- get user input as a string
  local input = vim.fn.input("Buffer number: ")
  local buf_num = tonumber(input)

  if buf_num and vim.api.nvim_buf_is_valid(buf_num) then
    -- open the buffer (edit)
    vim.api.nvim_set_current_buf(buf_num)
  else
    print("Invalid buffer number: " .. (input or ""))
  end
end

----------------------------------------------------------------------------------------------------
function M.get_buffer_counts()
  local listed = 0
  local total = 0
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    total = total + 1
    if vim.api.nvim_buf_get_option(bufnr, "buflisted") then
      listed = listed + 1
    end
  end
  return listed, total
end

----------------------------------------------------------------------------------------------------
function M.get_buffer_counts_str()
  local listed, total = M.get_buffer_counts()
  return string.format("%d(%d)", listed, total)
end

----------------------------------------------------------------------------------------------------
return M
