local debug = require("util/debug")

----------------------------------------------------------------------------------------------------
vim.api.nvim_create_user_command("Dbgattach", function()
  _G.d = debug
  -- Create :Dbg command that runs inside debug automatically
  vim.api.nvim_create_user_command("Dbg", function(opts)
    local code = "return debug." .. opts.args

    local f, err = load(code, "Dbg", "t", { debug = debug })
    if not f then
      print("Error: " .. err)
      return
    end

    local ok, res = pcall(f)
    if not ok then
      print("Runtime error: " .. res)
    elseif res ~= nil then
      print(vim.inspect(res))
    end
  end, {
    nargs = 1,
  })

  print("Debug attached as global 'd' and generic command loaded. "
        .. "Use :Dbg <path> (e.g., :Dbg print.ft())")
end, {})

----------------------------------------------------------------------------------------------------
vim.api.nvim_create_user_command("Dbglang", function()
  debug.print.resolver.lang()
end, {})

----------------------------------------------------------------------------------------------------
vim.api.nvim_create_user_command("Dbgft", function()
  debug.print.ft()
end, {})

----------------------------------------------------------------------------------------------------
vim.api.nvim_create_user_command("Dbgext", function()
  debug.print.resolver.ext()
end, {})
