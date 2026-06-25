vim.pack.add({
  "https://github.com/nvim-neotest/neotest",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/antoinemadec/FixCursorHold.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-neotest/neotest-python",
})

require("neotest").setup({
  adapters = {
    require("neotest-python"),
  },
})

vim.keymap.set("n", "<leader>tr", require("neotest").run.run, { desc = "test: run the nearest test" })
vim.keymap.set("n", "<leader>ts", require("neotest").run.stop, { desc = "test: stop the nearest test" })
vim.keymap.set("n", "<leader>to", require("neotest").output_panel.open, { desc = "test: shows the output of the test(s)" })
vim.keymap.set("n", "<leader>tm", require("neotest").summary.open, { desc = "test: opens menu of tests status" })
vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "test: run all tests in file" })
