# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration for user "jet", targeting Neovim 0.12+ (uses built-in `vim.pack` plugin manager, not lazy.nvim).

## Architecture

- `init.lua` — Entry point, loads `require("jet")`
- `lua/jet/init.lua` — Core setup: loads settings and remaps, defines autocmds (format-on-save, LSP keymaps, treesitter folding, bufferline visibility), then loads plugins **last** so a failing plugin config cannot prevent the autocmds from registering
- `lua/jet/set.lua` — Vim options (2-space indent, space as leader, comma as localleader, netrw disabled, `ignorecase`+`smartcase`, `inccommand=split`, `winborder=rounded`, `sessionoptions` tuned for auto-session)
- `lua/jet/remap.lua` — Global keymaps (`;`/`:` swapped, oil.nvim on `-`, conform format on `<leader>cf`)
- `lua/jet/pack.lua` — Plugin declarations via `vim.pack.add()` and auto-loads all `lua/plugins/*.lua` files alphabetically
- `lua/jet/languages.lua` — Single source of truth for supported languages; maps filetypes to treesitter parsers, used by both treesitter install and filetype autocmds
- `lua/plugins/*.lua` — Individual plugin configurations (one file per plugin or plugin group)

## Key patterns

- **Plugin management**: `vim.pack` (Neovim 0.12+ built-in), not lazy.nvim. Plugin URLs are built with the `gh()` helper. A `PackChanged` autocmd handles post-install hooks (e.g., `:TSUpdate`). Each `lua/plugins/*.lua` is required under `pcall` and reports failures via `vim.notify`, so one broken config does not take down the rest.
- **Adding a new language**: Add a filetype→parser entry to `lua/jet/languages.lua`. Treesitter install and filetype-based autocmds both derive from this table; missing parsers install automatically (async) on the next start, or via `:TSInstallConfigured`.
- **LSP**: Mason + mason-lspconfig with a default handler; language-specific overrides are inline in `lua/plugins/lsp.lua`.
- **Tooling**: formatters/linters/debug adapters are declared in `lua/plugins/mason-tool-installer.lua` and installed on start. Keep that `ensure_installed` list in sync with `conform.lua` and `lint.lua`. `rustfmt`/`gofmt` are intentionally absent (toolchain-provided, not Mason packages). That file loads after `lsp.lua` alphabetically, which is required — `mason.setup()` must run first.
- **Debugging**: nvim-dap + dap-ui, Go via nvim-dap-go (delve) and Python via nvim-dap-python (Mason's debugpy venv). Stepping is on F5/F6/F7/F10/F11/F12; breakpoints on `<leader>b`/`<leader>B` because `<leader>d` is the black-hole delete operator. Nothing may be bound under `<leader>b`. Rust/Java/Kotlin have no adapter configured.
- **Formatting**: conform.nvim with `format_after_save` enabled. Fallback: BufWritePre autocmd strips trailing whitespace when no conform formatter is available. Do **not** replace that autocmd with a `formatters_by_ft["_"]` entry — it matches every buffer, and `lsp_format = "fallback"` only reaches the LSP when no conform formatter resolves, so LSP-formatted filetypes (json, yaml, html, css, terraform, toml) would silently regress.
- **Linting**: nvim-lint triggers on `BufReadPost`, `BufWritePost`, `InsertLeave`.
- **Completion**: blink.cmp (pinned to version range `1.0`). Its `completion.menu.border` is pinned to `"none"` on purpose — blink falls back to `vim.o.winborder` when border is `nil`, which would put a rounded border on the completion popup.
- **Float borders**: set globally via `winborder`, not per-plugin. Anything creating a float without an explicit border inherits it, including `vim.diagnostic` floats and LSP hover.
- **Colorscheme**: sonokai (shusia variant), transparent background via `g:sonokai_transparent_background` plus `g:sonokai_float_style = "blend"` (needed for transparent floats — the default `"dim"` gives them a backdrop).
- **Tabs**: bufferline runs in `mode = "tabs"` and owns `showtabline` via `always_show_bufferline = false`. All tab keys share the `<leader>t` prefix.
- **Keymaps**: leader groups are `c` Code, `f` Find, `g` Git, `q` Session, `r` Rovo Dev, `t` Tabs, `v` LSP, `x` Diagnostics; `gs` is surround. Declare new groups in `lua/plugins/which-key.lua`.
  Bracket pairs are the convention for list/hunk navigation: `]c`/`[c` hunks, `]q`/`[q` quickfix, `]t`/`[t` todo, `]x`/`[x` trouble, `]d`/`[d` diagnostics (built-in), `[C` treesitter context. `<C-k>` is signature help in normal *and* insert mode — which is why quickfix nav is not on `<C-k>`/`<C-j>`.
  Never add a binding under a prefix that is *itself* a complete mapping — e.g. `<leader>s` (replace word under cursor) and `s` (flash) are complete, so `<leader>s?`/`s?` would make every `<leader>s`/`s` press wait out `timeoutlen` (1000ms). This is why grug-far is on `<leader>F` and chmod is on `<leader>cx`.
- **Local plugin**: `~/Repos/rovo-dev.nvim/main` is prepended to rtp.

## Style

All Lua files use tabs for indentation rendered at 2 spaces (per stylua config convention). Use `stylua` for formatting Lua in this repo.
