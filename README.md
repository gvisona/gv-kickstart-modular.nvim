# nvim config

Personal Neovim configuration built on [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim). Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. Plugins are split into individual files under `lua/custom/plugins/`.

## Key plugins

| Area | Plugins |
|------|---------|
| LSP | nvim-lspconfig, Mason, fidget.nvim |
| Completion | blink.cmp |
| Syntax | nvim-treesitter |
| Fuzzy find | Telescope |
| File tree | Neo-tree |
| Formatting | Conform, treesj, indent-blankline |
| Linting | nvim-lint |
| Git | gitsigns, blame.nvim, github-pr-reviewer |
| Notes | obsidian.nvim (2 vaults), markdown-preview, img-clip |
| UI | Catppuccin Macchiato, mini.nvim (statusline, pairs, surround, ai, operators) |
| Utils | which-key, todo-comments, vim-sleuth, quick-scope |

## LSP / tools installed via Mason

`lua_ls`, `pylsp`, `gopls`, `golangci-lint-langserver`, `marksman`, `stylua`, `black`, `yamllint`, `tree-sitter-cli`

## Obsidian vaults

- `~/Obsidian/Alexandria` — personal notes (Zettelkasten)
- `~/Obsidian/WorkNotes` — work notes
