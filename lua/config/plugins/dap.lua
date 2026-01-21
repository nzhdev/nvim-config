return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
		"theHamsta/nvim-dap-virtual-text",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()
		require("dap-go").setup()
		require("nvim-dap-virtual-text").setup()
		require("dap-python").setup("uv")

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "debugger: toggle breakpoint" })
		vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "debugger: restart" })

		vim.keymap.set(
			"n",
			"<leader>dc",
			dap.continue,
			{ desc = "debugger: continue (Runs the program until the next breakpoint or until it finishes)" }
		)
		vim.keymap.set(
			"n",
			"<leader>dso",
			dap.step_over,
			{ desc = "debugger: step over (Executes the current line but skips over any function calls)" }
		)
		vim.keymap.set(
			"n",
			"<leader>dsb",
			dap.step_back,
			{ desc = "debugger: step back (Steps the program backwards to the previous instruction)" }
		)

		vim.keymap.set(
			"n",
			"<leader>dfi",
			dap.step_into,
			{ desc = "debugger: step into (Executes the current line and enters any function calls on that line)" }
		)

		vim.keymap.set(
			"n",
			"<leader>dfo",
			dap.step_out,
			{ desc = "debugger: step out (Continues running until the current function returns and then stops)" }
		)

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
