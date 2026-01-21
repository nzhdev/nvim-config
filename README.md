# Neovim Configuration

This is a personal Neovim configuration built with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Keybindings

Leader key is set to `<Space>`.

### General
| Keybinding | Action | Mode |
|Data|Description|Mode|
|---|---|---|
| `<leader>p` | Paste from system clipboard | Normal |
| `<leader>y` | Yank to system clipboard | Normal, Visual |
| `<leader><leader>x` | Source current file | Normal |
| `<leader>x` | Run highlighted Lua code | Visual |
| `gb` | Go back in jump list (remapped from `<C-o>`) | Normal |
| `gf` | Go forward in jump list (remapped from `<C-i>`) | Normal |

### Plugins

#### Telescope (Fuzzy Finder)
| Keybinding | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |
| `<space>fn` | Edit Neovim configuration files |

#### Oil (File Explorer)
| Keybinding | Action |
|---|---|
| `<leader>e` | Open parent directory (File explorer) |

#### LSP (Language Server Protocol)
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

#### Debugger (DAP)
| Keybinding | Action |
|---|---|
| `<leader>db` | Toggle breakpoint |
| `<leader>dr` | Restart |
| `<leader>dc` | Continue |
| `<leader>dso` | Step over |
| `<leader>dsb` | Step back |
| `<leader>dfi` | Step into |
| `<leader>dfo` | Step out |

#### Testing (Neotest)
| Keybinding | Action |
|---|---|
| `<leader>tr` | Run nearest test |
| `<leader>ts` | Stop nearest test |
| `<leader>to` | Show test output panel |
| `<leader>tm` | Open test summary menu |

#### Completion (Blink.cmp)
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

#### Which-Key
| Keybinding | Action |
|---|---|
| `<leader>?` | Show buffer local keymaps |

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
- **mason.nvim**: Portable package manager for LSPs, DAPs, linters, and formatters.
- **nvim-lspconfig**: Quickstart configs for Nvim LSP.
- **blink.cmp**: Fast completion engine.
- **lazydev.nvim**: Lua development setup for Neovim config.

### Formatting & Linting
- **conform.nvim**: Lightweight formatter (auto-format on save).
- **nvim-lint**: Asynchronous linter.

### Tools & Utilities
- **telescope.nvim**: Fuzzy finder (files, grep, buffers, etc.).
- **oil.nvim**: File system editor (edit directory like a buffer).
- **nvim-treesitter**: Advanced syntax highlighting and parsing.
- **gitsigns.nvim**: Git integration (signs in gutter, etc.).
- **ultimate-autopair**: Auto-close brackets and quotes.

### Debugging & Testing
- **nvim-dap**: Debug Adapter Protocol client.
- **neotest**: Framework for running tests.
