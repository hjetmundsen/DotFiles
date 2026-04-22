# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration for user "jet", targeting Neovim 0.12+ (uses built-in `vim.pack` plugin manager, not lazy.nvim).

## Architecture

- `init.lua` — Entry point, loads `require("jet")`
- `lua/jet/init.lua` — Core setup: loads settings, remaps, and plugins; defines autocmds (format-on-save, LSP keymaps, treesitter folding, bufferline visibility)
- `lua/jet/set.lua` — Vim options (2-space indent, space as leader, comma as localleader, netrw disabled)
- `lua/jet/remap.lua` — Global keymaps (`;`/`:` swapped, oil.nvim on `-`, conform format on `<leader>cf`)
- `lua/jet/pack.lua` — Plugin declarations via `vim.pack.add()` and auto-loads all `lua/plugins/*.lua` files alphabetically
- `lua/jet/languages.lua` — Single source of truth for supported languages; maps filetypes to treesitter parsers, used by both treesitter install and filetype autocmds
- `lua/plugins/*.lua` — Individual plugin configurations (one file per plugin or plugin group)

## Key patterns

- **Plugin management**: `vim.pack` (Neovim 0.12+ built-in), not lazy.nvim. Plugin URLs are built with the `gh()` helper. A `PackChanged` autocmd handles post-install hooks (e.g., `:TSUpdate`).
- **Adding a new language**: Add a filetype→parser entry to `lua/jet/languages.lua`. Treesitter install and filetype-based autocmds both derive from this table.
- **LSP**: Mason + mason-lspconfig with a default handler; language-specific overrides are inline in `lua/plugins/lsp.lua`.
- **Formatting**: conform.nvim with `format_after_save` enabled. Fallback: BufWritePre autocmd strips trailing whitespace when no conform formatter is available.
- **Linting**: nvim-lint triggers on `BufEnter`, `BufWritePost`, `InsertLeave`.
- **Completion**: blink.cmp (pinned to version range `1.0`).
- **Colorscheme**: sonokai (shusia variant) with transparent background.
- **Local plugin**: `~/Repos/rovo-dev.nvim/main` is prepended to rtp.

## Style

All Lua files use tabs for indentation rendered at 2 spaces (per stylua config convention). Use `stylua` for formatting Lua in this repo.
