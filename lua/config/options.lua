local opt = vim.opt

-- line
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true -- Highlight current line
opt.signcolumn = "yes" -- prevents shifting w/ git or debugger icons

-- text
opt.wrap = true -- Long lines wrap to next screen line
opt.linebreak = true -- Wrapped lines break cleanly at word boundaries

-- indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- search
opt.smartcase = true
opt.ignorecase = true

-- others
opt.undofile = true
opt.swapfile = false

opt.inccommand = "split" -- enables live preview of substitutions in a split window

