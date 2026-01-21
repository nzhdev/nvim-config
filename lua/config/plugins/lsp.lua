return {
	"mason-org/mason.nvim",
	"mason-org/mason-lspconfig.nvim",
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- lua
					"lua_ls", -- language server
					"stylua", -- formatter
					-- dont really need a linter for lua
					-- "luacheck", -- linter

					-- go
					"gopls", -- language server
					"gofumpt", -- formatter (more strict than gofmt)
					"golangci-lint", -- linter (combines multiple ex: go vet)

					-- rust
					"rust_analyzer", -- language server
					"rustfmt", -- formatter

					-- c + cpp
					"clangd", -- server + linter (contains clang-tidy)
					"clang-format", -- formatter

					-- web
					"biome", -- formatter & linter for js, ts, jsx, json, css, graphql
					"html",
					"ts_ls",
					"cssls",

					-- python
					"basedpyright", -- server + liter
					"ruff", -- liter + formatter
					-- "debugpy", -- debugger (installed instead through uv)
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			require("lspconfig")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(args)
					local builtin = require("telescope.builtin")

					-- vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
					vim.keymap.set("n", "gd", builtin.lsp_definitions, {
						buffer = 0,
						desc = "Go to definition",
					})
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
						buffer = 0,
						desc = "Go to declaration",
					})
					vim.keymap.set("n", "gr", builtin.lsp_references, {
						buffer = 0,
						desc = "Go to references",
					})
					vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {
						buffer = 0,
						desc = "Go to type definition",
					})
					vim.keymap.set("n", "K", vim.lsp.buf.hover, {
						buffer = 0,
						desc = "Hover",
					})
					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {
						buffer = 0,
						desc = "Rename",
					})
					vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {
						buffer = 0,
						desc = "Diagnostic",
					})
					-- tried w/ telescope-ui-select
					-- but I think I like it like this more
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
						buffer = 0,
						desc = "Code action",
					})
					vim.keymap.set("n", "<leader>wd", builtin.lsp_document_symbols, {
						buffer = 0,
						desc = "List of symbols in current buffer",
					})
				end,
			})
		end,
	},
}
