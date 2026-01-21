return function (group)
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "*",
    callback = function()
      vim.opt_local.formatoptions = "jql"
-- j -> When it makes sense, remove comment leader when joining lines
-- q -> Allow formatting comments with "gq"
-- l -> Long lines are not broken in insert mode 
    end,
  })
end
