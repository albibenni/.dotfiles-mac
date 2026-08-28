# macOS theme switcher

This package provides a single `theme` command for the Catppuccin variants already used by tmux. It coordinates Ghostty, tmux, Neovim, VS Code, macOS appearance, Chrome/Brave's device appearance, and a per-theme wallpaper.

The selectable profiles are Catppuccin Latte, Frappe, Macchiato, Mocha, Tokyo Night, Night Owl, and Custom. Tokyo Night and Night Owl use their native Ghostty, Neovim, and VS Code themes; tmux retains Catppuccin Mocha for those two profiles because the current tmux status configuration depends on Catppuccin's palette variables. Custom preserves the settings you had before this switcher: Catppuccin Mocha in Ghostty/tmux, your customized transparent Tokyo Night palette in Neovim, Night Owl in VS Code, and your previous wallpaper.

## Install

Stow the package, then install the VS Code theme once:

```bash
./script_install/stow_theme_switcher.sh
code --install-extension Catppuccin.catppuccin-vsc
code --install-extension enkia.tokyo-night
code --install-extension sdras.night-owl
```

The installer is safe to re-run: it restows both `local` (which supplies the command) and `theme-switcher`.

After opening a new terminal, press `Tab` after `theme ` to complete commands, or after `theme set ` to complete the currently configured theme names. Bash and Zsh are both supported.

In Chrome and Brave, choose **Customize Chrome/Brave → Appearance → Device**. The browser will then follow the light/dark appearance applied by this command. Chromium does not expose a supported command-line interface for changing its arbitrary accent palette.

Place the wallpaper files named in `.config/theme-switcher/themes.conf` in `.config/theme-switcher/wallpapers/`.

## Use

```bash
theme list
theme set mocha
theme current
```

`theme set` changes the persistent state first, then updates live tmux and available Neovim servers. Reload existing Ghostty windows with `cmd+shift+,`; reload VS Code windows with **Developer: Reload Window**. Wallpaper files are optional: a missing file produces a warning without changing the current wallpaper.

Ghostty and Neovim are configured to remain transparent for every profile.

SwiftBorders follows each profile’s accent color. The switcher writes `~/.config/swiftborders/swiftbordersrc` and restarts SwiftBorders so old command-line color arguments cannot override the selected theme. AeroSpace invokes `theme borders` on startup, so the saved theme’s border color is generated before SwiftBorders starts.

The script updates VS Code's user `settings.json` only when the configured theme is installed. Quit VS Code first if you want to avoid a settings-write race.
