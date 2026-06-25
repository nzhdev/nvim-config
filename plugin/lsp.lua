vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
})

vim.lsp.config("ty", {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = { "ty.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
})
vim.lsp.enable("ty")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local opts = function(desc) return { buffer = args.buf, desc = desc } end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Go to references"))
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts("Go to type definition"))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename"))
    vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts("Diagnostic"))
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
    vim.keymap.set("n", "<leader>wd", vim.lsp.buf.document_symbol, opts("Document symbols"))

    vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, opts("Format"))
    vim.keymap.set("n", "<leader>co", function()
      vim.lsp.buf.code_action({ only = { "source.organizeImports" } })
    end, opts("Organize imports"))
    vim.keymap.set("n", "<leader>cF", function()
      vim.lsp.buf.code_action({ only = { "source.fixAll" } })
    end, opts("Fix all"))

    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Next diagnostic"))
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Previous diagnostic"))
  end,
})
