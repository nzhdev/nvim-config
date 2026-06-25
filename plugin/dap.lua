vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/mfussenegger/nvim-dap-python",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/nvim-neotest/nvim-nio",
})

local dap = require("dap")
local dapui = require("dapui")

require("dapui").setup()
require("dap-python").setup("uv")

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "debugger: toggle breakpoint" })
vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "debugger: restart" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "debugger: continue" })
vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "debugger: step over" })
vim.keymap.set("n", "<leader>dsb", dap.step_back, { desc = "debugger: step back" })
vim.keymap.set("n", "<leader>dfi", dap.step_into, { desc = "debugger: step into" })
vim.keymap.set("n", "<leader>dfo", dap.step_out, { desc = "debugger: step out" })
vim.keymap.set("n", "<leader>dt", function()
  require("neotest").run.run({ strategy = "dap" })
end, { desc = "debug: nearest test" })

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
