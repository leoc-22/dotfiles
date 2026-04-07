# tmux-layout

A lightweight tmux workspace manager inspired by ThePrimeagen's sessionizer. Define your tmux layouts declaratively in simple text files, then spin up entire sessions with one command.

## Installation

1. **Add `bin/` to your PATH**

   Fish shell (add to `config.fish`):
   ```fish
   fish_add_path ~/dotfiles/bin
   ```

   Zsh (add to `.zshrc`):
   ```bash
   export PATH="$HOME/dotfiles/bin:$PATH"
   ```

2. **Make the script executable**
   ```bash
   chmod +x ~/dotfiles/bin/tmux-layout
   ```

3. **Reload your tmux config** (for the keybinding):
   ```
   tmux source-file ~/.tmux.conf
   ```

## Usage

```bash
# Launch a specific layout
tmux-layout work

# Pick a layout with fzf
tmux-layout
```

**Inside tmux:** Press `<prefix> L` (`C-j L`) to open an fzf popup and pick a layout.

If a session with the same name already exists, the script will simply attach/switch to it instead of creating a duplicate.

## Layout File Format

Layout files live in `~/dotfiles/tmux/layouts/` with a `.layout` extension. The format uses 4 keywords:

| Keyword | Description |
|---------|-------------|
| `session: <name>` | **Required.** Names the tmux session. Must appear before any `window:` line. |
| `window: <name>` | Creates a new window with the given name. |
| `cmd: <command>` | Sends a command to the current pane. Multiple `cmd:` lines run sequentially. |
| `split: horizontal\|vertical` | Splits the current pane. `horizontal` = side-by-side, `vertical` = top/bottom. Subsequent `cmd:` lines target the new pane. |

Lines starting with `#` are comments. Blank lines are ignored.

## Example

```
# ~/dotfiles/tmux/layouts/work.layout
session: work

window: cow
cmd: z cow
cmd: pnpm dev

window: cob
cmd: z cob
cmd: pnpm dev

window: cos
cmd: z cos
cmd: ./gradlew bootRun
split: horizontal
cmd: mysql -P 3301 --protocol=tcp -u root -ppaymenow
```

This creates a session called "work" with 3 windows:
- **cow** — navigates to the cow project and runs the dev server
- **cob** — navigates to the cob project and runs the dev server
- **cos** — navigates to the cos project, runs the Gradle app, and opens a MySQL client in a side-by-side split pane

## Creating a New Layout

1. Create a new file in `~/dotfiles/tmux/layouts/`:
   ```bash
   vim ~/dotfiles/tmux/layouts/myproject.layout
   ```

2. Add your layout definition using the keywords above.

3. Run it:
   ```bash
   tmux-layout myproject
   ```

## Configuration

| Environment Variable | Default | Description |
|---------------------|---------|-------------|
| `TMUX_LAYOUT_DIR` | `~/dotfiles/tmux/layouts` | Directory to search for `.layout` files |
