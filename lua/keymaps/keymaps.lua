local keymap = vim.keymap.set

keymap("n", "<leader><Tab>", "<cmd>retab<CR>", { desc = "Change tab type to current config" }) 
