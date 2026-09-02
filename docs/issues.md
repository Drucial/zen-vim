# Issues

Open tasks for this config. Newest at the bottom.

## Open

### `<leader>bd` collapses split layouts

`:bdelete` closes every window showing the buffer, so deleting the last buffer
in a split takes the split with it. `Snacks.bufdelete` preserves the layout.

### Ruby `format_on_save` blocks on save

`format_on_save` is synchronous with a 3s timeout, and rubocop runs through
`bundle exec`. On a large file that stall is visible. Consider
`format_after_save` for ruby specifically.

### Colorscheme ownership is decided by event ordering

Omarchy applies the colorscheme after `lazy.setup()`; zen-theme applies its own
on `VimEnter`, so it wins by running later. Neither is the declared authority.
Pick one and make the precedence explicit.

### Theme hot-reload never tested end to end

The `LazyReload` autocmd is registered and lazy's reloader tracks `theme.lua`,
but an actual `omarchy theme set` has never been run to confirm nvim follows.
Verified structurally only.

### Mason installs enable themselves without being declared

`mason-lspconfig`'s `automatic_enable` defaults to true, so any server present in
mason starts attaching whether or not the config asks for it. A leftover `ts_ls`
ran alongside `vtsls` this way for a day, doubling diagnostics and memory.
`html-lsp` is currently installed and undeclared. Either set
`automatic_enable = false` and enable servers explicitly, or treat
`ensure_installed` as authoritative and prune mason to match.

### Evaluate remaining snacks modules

Snacks currently loads with only the picker configured. Worth assessing
`bufdelete`, `input`, `notifier`, `statuscolumn`, `indent`, and `lazygit`.
