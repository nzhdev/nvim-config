# Neovim Configuration

A personal Neovim configuration built with [vim.pack](https://neovim.io/doc/user/lua.html#vim.pack) (Neovim 0.11+).

## Keybindings

Leader key is set to `<Space>`.

### General
| Keybinding | Action | Mode |
|---|---|---|
| `<leader>p` | Paste from system clipboard | Normal |
| `<leader>y` | Yank to system clipboard | Normal, Visual |
| `<leader><leader>x` | Source current file | Normal |
| `<leader>x` | Run highlighted Lua code | Visual |
| `gb` | Go back in jump list (remapped from `<C-o>`) | Normal |
| `gf` | Go forward in jump list (remapped from `<C-i>`) | Normal |

### FFF (File Finder)

FFF is a Rust-powered fuzzy file picker with frecency sorting, git integration, and multi-mode grep.

| Keybinding | Action |
|---|---|
| `ff` | Find files |
| `fg` | Live grep |
| `fz` | Fuzzy grep (cycles plain/regex/fuzzy modes) |
| `fc` | Search word under cursor |

#### FFF vs Telescope

| Feature | FFF | Telescope (old) |
|---|---|---|
| File finding | `ff` — frecency-sorted | `<leader>ff` — gitignore-aware |
| Live grep | `fg` — plain/regex/fuzzy modes | `<leader>fg` — ripgrep-powered |
| Fuzzy grep | `fz` — cycles search modes | No built-in equivalent |
| Search word under cursor | `fc` — one keypress | `<leader>fg` + manually type word |
| Buffer picker | Not available | `<leader>fb` |
| Help tags | Not available | `<leader>fh` |
| Speed | Rust SIMD, very fast | Lua, fast (ripgrep for grep) |
| Dependencies | Self-contained binary | Requires ripgrep, fd (optional) |
| Sorting | Frecency (remembers usage) | No frecency |
| Git integration | Built-in status highlighting | Via extensions |

#### FFF Picker Keybindings (inside the picker)

| Key | Action |
|---|---|
| `<Space>` | Close picker |
| `<C-j>` / `<C-k>` | Navigate results |
| `<C-d>` / `<C-u>` | Scroll preview |
| `<CR>` | Open in current window |
| `<C-x>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `<C-t>` | Open in new tab |
| `<Tab>` | Toggle selection |
| `<C-q>` | Send selected to quickfix |

#### FFF Commands

| Command | Action |
|---|---|
| `:FFFFind [path\|query]` | Open file picker |
| `:FFFScan` | Rescan files |
| `:FFFRefreshGit` | Refresh git status |
| `:FFFClearCache all` | Clear all caches |
| `:FFFHealth` | Health check |

### Oil (File Explorer)
| Keybinding | Action |
|---|---|
| `<leader>e` | Open parent directory |

### LSP (ty — Python Type Checker)
| Keybinding | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gT` | Go to type definition |
| `K` | Hover documentation |
| `<leader>cr` | Rename |
| `<leader>cd` | Open diagnostic float |
| `<leader>ca` | Code action |
| `<leader>wd` | List document symbols |
| `<leader>cf` | Format buffer |
| `<leader>co` | Organize imports |
| `<leader>cF` | Fix all |

### Diagnostics
| Keybinding | Action |
|---|---|
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |

### Debugger (DAP)
| Keybinding | Action |
|---|---|
| `<leader>db` | Toggle breakpoint |
| `<leader>dr` | Restart |
| `<leader>dc` | Continue |
| `<leader>dso` | Step over |
| `<leader>dsb` | Step back |
| `<leader>dfi` | Step into |
| `<leader>dfo` | Step out |
| `<leader>dt` | Debug nearest test |

### Testing (Neotest)
| Keybinding | Action |
|---|---|
| `<leader>tr` | Run nearest test |
| `<leader>ts` | Stop nearest test |
| `<leader>to` | Show test output panel |
| `<leader>tm` | Open test summary |
| `<leader>tf` | Run all tests in file |

### Completion (Blink.cmp)
| Keybinding | Action |
|---|---|
| `Enter` | Accept completion |
| `<C-space>` | Open menu / docs |
| `<C-n>` / `Down` | Select next item |
| `<C-p>` / `Up` | Select previous item |
| `<C-e>` | Hide menu |
| `<C-k>` | Toggle signature help |
| `<Tab>` | Select next (fallback) |
| `<S-Tab>` | Select previous (fallback) |

### Which-Key
| Keybinding | Action |
|---|---|
| `<leader>?` | Show buffer local keymaps |

---

## Installation

### Prerequisites

This config requires **Neovim 0.11+** (for `vim.pack` and `vim.lsp.config`).

### Python Tooling

Install `ty` (type checker) and `ruff` (linter/formatter):

```bash
# Recommended: via uv
curl -LsSf https://astral.sh/uv/install.sh | sh
uv tool install ty@latest
uv tool install ruff@latest

# Alternative: standalone installers
curl -LsSf https://astral.sh/ty/install.sh | sh
curl -LsSf https://astral.sh/ruff/install.sh | sh

# Alternative: via pip
pip install ty ruff
```

Verify installation:
```bash
which ty ruff
ty --version
ruff --version
```

### Python Debugger

`nvim-dap-python` uses `uv` to run the debugger (debugpy is managed automatically):
```bash
# Ensure uv is installed (see above)
# No additional setup needed
```

---

## Native Neovim Capabilities

Useful built-in commands often overlooked.

### Marks
- `m{a-z}`: Set mark {a-z} at cursor position.
- `'{a-z}`: Jump to mark {a-z} (first non-blank character of line).
- `` `{a-z} ``: Jump to mark {a-z} (exact position).
- `''`: Jump back to the line of the last jump.

### Editing (Operators & Motions)
Combine operators (`c`: change, `d`: delete, `y`: yank) with motions or text objects.

**Basic Motions:**
- `w`: Next word start.
- `b`: Previous word start.
- `e`: Next word end.
- `$`: End of line.
- `0`: Start of line.

**Text Objects (Inner vs Around):**
- `iw`: Inner word (select word).
- `aw`: Around word (select word + whitespace).
- `i"` / `a"`: Inside/Around double quotes.
- `i'` / `a'`: Inside/Around single quotes.
- `i(` / `a(`: Inside/Around parentheses.
- `i{` / `a{`: Inside/Around curly braces.
- `it` / `at`: Inside/Around XML/HTML tags.

**Examples:**
- `ci"`: Change text inside double quotes.
- `daw`: Delete a word and its trailing space.
- `yap`: Yank a paragraph.

### Buffer Navigation
- `:bn` / `:bnext`: Go to next buffer.
- `:bp` / `:bprev`: Go to previous buffer.
- `:bd`: Delete (close) current buffer.
- `<C-^>` (or `<C-6>`): Switch to the alternate (previous) buffer.

### Window Navigation
- `<C-w>h`: Focus left window.
- `<C-w>j`: Focus bottom window.
- `<C-w>k`: Focus top window.
- `<C-w>l`: Focus right window.
- `<C-w>v`: Split window vertically.
- `<C-w>s`: Split window horizontally.

---

## Installed Plugins

### UI & Appearance
- **catppuccin**: Colorscheme (Macchiato).
- **mini.nvim**: Statusline configuration.
- **which-key.nvim**: Popup showing available keybindings.
- **todo-comments.nvim**: Highlight TODO/FIXME comments.

### LSP & Completion
- **nvim-lspconfig**: LSP configuration (used for ty setup).
- **blink.cmp**: Fast completion engine.
- **lazydev.nvim**: Lua development setup for Neovim config.

### Formatting & Linting
- **conform.nvim**: Lightweight formatter (auto-format on save).
- **nvim-lint**: Asynchronous linter.

### Tools & Utilities
- **fff.nvim**: Rust-powered fuzzy file picker (files, grep, frecency).
- **oil.nvim**: File system editor (edit directory like a buffer).
- **nvim-treesitter**: Advanced syntax highlighting and parsing.
- **gitsigns.nvim**: Git integration (signs in gutter, etc.).
- **ultimate-autopair**: Auto-close brackets and quotes.

### Debugging & Testing
- **nvim-dap**: Debug Adapter Protocol client.
- **nvim-dap-ui**: DAP UI (variables, stack trace, etc.).
- **nvim-dap-python**: Python debugging (via uv/debugpy).
- **neotest**: Framework for running tests.
- **neotest-python**: Python test adapter (pytest).
