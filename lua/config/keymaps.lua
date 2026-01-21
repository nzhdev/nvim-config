-- text
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
-- yank current line in normal mode or yank selected text in visual mode to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- source current (most recent) file
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })

-- run highlighted lua code
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Run highlighted lua code" })

-- jumps
-- example gd (go definition) then we can use gb to go back to previous buffer 
vim.keymap.set("n", "gb", "<C-o>", { desc = "Go back in jump list" })
vim.keymap.set("n", "gf", "<C-i>", { desc = "Go forward in jump list" })

