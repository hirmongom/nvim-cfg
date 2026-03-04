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
return M
