return function (group)

	local function run_tool(mode, notify)
		local script = vim.fn.stdpath("config")
			.. "/tools/touchpad"

		local args = { script, "--" .. mode }
    table.insert(args, "--simple")

		if notify then
			table.insert(args, "--notify")
		end

		vim.fn.jobstart(args, { detach = true })
	end

	-- Nvim lifecycle events
	vim.api.nvim_create_autocmd("VimEnter", {
		group = group,
		callback = function()
			run_tool("disable", false)
		end,
	})

	vim.api.nvim_create_autocmd("VimLeavePre", {
		group = group,
		callback = function()
			run_tool("enable", false)
		end,
	})

	-- Nvim focus events
	vim.api.nvim_create_autocmd("FocusGained", {
		group = group,
		callback = function()
			run_tool("disable", false)
		end,
	})

	vim.api.nvim_create_autocmd("FocusLost", {
		group = group,
		callback = function()
			run_tool("enable", false)
		end,
	})

end
