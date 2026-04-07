# tmux-layout

A lightweight tmux workspace manager inspired by ThePrimeagen's sessionizer. Define your tmux layouts as YAML files, then spin up entire sessions with one command.

## Prerequisites

- [yq](https://github.com/mikefarah/yq) - YAML processor for bash
  ```bash
  brew install yq
  ```
- [fzf](https://github.com/junegunn/fzf) - fuzzy finder (optional, for layout picker)

## Installation

1. **Add `bin/` to your PATH**

   Fish shell (already in `config.fish`):
   ```fish
   fish_add_path ~/dotfiles/bin
   ```

   Zsh (already in `.zshrc`):
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

Layout files live in `~/dotfiles/tmux/layouts/` with a `.yaml` extension.

```yaml
session: <name>          # Required. Names the tmux session.

windows:
  - name: <window-name>  # Creates a named window.
    commands:             # Commands to run in the main pane (sequential).
      - <command>
      - <command>
    panes:                # Optional. Additional split panes.
      - split: horizontal # horizontal = side-by-side, vertical = top/bottom
        commands:
          - <command>
```

## Example

```yaml
# ~/dotfiles/tmux/layouts/work.yaml
session: work

windows:
  - name: cow
    commands:
      - z cow
      - pnpm dev

  - name: cob
    commands:
      - z cob
      - pnpm dev

  - name: cos
    commands:
      - z cos
      - ./gradlew bootRun
    panes:
      - split: horizontal
        commands:
          - mysql -P 3301 --protocol=tcp -u root -ppaymenow
```

This creates a session called "work" with 3 windows:
- **cow** -- navigates to the cow project and runs the dev server
- **cob** -- navigates to the cob project and runs the dev server
- **cos** -- navigates to the cos project, runs the Gradle app, and opens a MySQL client in a side-by-side split pane

## Creating a New Layout

1. Create a new YAML file in `~/dotfiles/tmux/layouts/`:
   ```bash
   vim ~/dotfiles/tmux/layouts/myproject.yaml
   ```

2. Define your session, windows, and panes using the format above.

3. Run it:
   ```bash
   tmux-layout myproject
   ```

## Configuration

| Environment Variable | Default | Description |
|---------------------|---------|-------------|
| `TMUX_LAYOUT_DIR` | `~/dotfiles/tmux/layouts` | Directory to search for `.yaml` files |
