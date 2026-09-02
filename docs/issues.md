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

### Omarchy symlink dangles on macOS

`lua/plugins/theme.lua` symlinks to the absolute path
`~/.local/state/omarchy/current/theme/neovim.lua`, which does not exist on the
Mac this config also targets. Pre-existing from the backup config, not a
regression.

### Colorscheme ownership is decided by event ordering

Omarchy applies the colorscheme after `lazy.setup()`; zen-theme applies its own
on `VimEnter`, so it wins by running later. Neither is the declared authority.
Pick one and make the precedence explicit.

### Theme hot-reload never tested end to end

The `LazyReload` autocmd is registered and lazy's reloader tracks `theme.lua`,
but an actual `omarchy theme set` has never been run to confirm nvim follows.
Verified structurally only.

### Evaluate remaining snacks modules

Snacks currently loads with only the picker configured. Worth assessing
`bufdelete`, `input`, `notifier`, `statuscolumn`, `indent`, and `lazygit`.
