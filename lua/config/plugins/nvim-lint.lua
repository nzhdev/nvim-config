return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			-- NOTE: Don't include linters that already included (most often as a language server)
			-- ex: ruff, clangd... Otherwise, you'll have duplicates

			go = { "golangcilint" },

			javascript = { "biomejs" },
			typescript = { "biomejs" },
			javascriptreact = { "biomejs" },
			typescriptreact = { "biomejs" },
			json = { "biomejs" },
			css = { "biomejs" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})

		-- Note: for now just going with default
		-- originally liked this, but the visuals are a bit much
		-- vim.diagnostic.config({ virtual_lines = true })
		-- A more visually pleasing option
		-- vim.diagnostic.config({
		-- 	virtual_text = false,
		-- 	virtual_lines = false,
		-- 	signs = true,
		-- 	underline = true,
		-- 	float = {
		-- 		border = "rounded",
		-- 		source = "always",
		-- 	},
		-- })
	end,
}
