return function(group)
	vim.api.nvim_create_autocmd(
		{ "BufDelete", "BufWipeout" },
		{
			group = group,
			callback = function()
				vim.schedule(function()
          local listed = vim.fn.getbufinfo({ buflisted = 1 })
          if #listed ~= 1 then
            -- There are still listed buffers
            return
          end

          local buf = listed[1]
          local name = buf.name
          local bufnr = buf.bufnr

          if name ~= "" then
            -- Last listed buffer is not the empty buffer
            return
          end

          local bt = vim.bo[bufnr].buftype
          if bt ~= "" then
            -- Last listed buffer is not the empty buffer
            return
          end

          -- Triggers if the only listed buffer left is the empty buffer
          --  (opens when no other buffers left)

          -- Open Tree
          require("nvim-tree.api").tree.open()

          -- Wipe the empty buffer
          vim.cmd("bwipeout " .. bufnr)
        end)
      end
		}
	)
end
