return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },

				go = { "gofumpt" },

				rust = { "rustfmt" },

				c = { "clang_format" },

				cc = { "clang_format" },
				cpp = { "clang_format" },

				javascript = { "biome" },
				typescript = { "biome" },

				-- note: for future reference
				-- if you're unsure of a file type
				-- run: :lua print(vim.bo.filetype)
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				json = { "biome" },
				css = { "biome" },

				-- all that's left is python
				python = {
					"ruff_fix",
					"ruff_format",
					"ruff_organize_imports",
				},
			},
			formatters = {
				clang_format = {
					prepend_args = {
						"--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
					},
				},
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
