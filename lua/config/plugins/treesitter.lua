---@diagnostic disable: missing-fields
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"cmake",
					"cpp",
					"dockerfile",
					"css",
					"go",
					"html",
					"javascript",
					"json",
					"make",
					"nix",
					"rust",
					"sql",
					"terraform",
					"toml",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"markdown",
					"markdown_inline",
					"typescript",
					"python",
					"yaml",
					"latex",
					"typst",
				},

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				highlight = {
					enable = true,

					-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,

					additional_vim_regex_highlighting = false,
				},

				-- experimental feature:
				-- use treesitter to format highlighted text when using '='
				indent = {
					enable = true,
				},
			})
		end,
	},
}
