return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python"),
				},
			})

			vim.keymap.set("n", "<leader>tr", require("neotest").run.run, { desc = "test: run the nearest test" })
			vim.keymap.set("n", "<leader>ts", require("neotest").run.stop, { desc = "test: stop the nearest test" })
			vim.keymap.set(
				"n",
				"<leader>to",
				-- prefer output_panel (bottom) over panel (which is a floating terminal)
				require("neotest").output_panel.open,
				{ desc = "test: shows the output of the test(s)" }
			)
			vim.keymap.set(
				"n",
				"<leader>tm",
				require("neotest").summary.open,
				{ desc = "test: opens menu of tests status" }
			)
		end,
	},
}
