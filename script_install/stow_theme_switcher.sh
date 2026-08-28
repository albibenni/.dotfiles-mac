#!/usr/bin/env bash

set -euo pipefail

repository_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
target="${THEME_STOW_TARGET:-$HOME}"

command -v stow >/dev/null 2>&1 || {
	printf 'GNU Stow is required. Install it with: brew install stow\n' >&2
	exit 1
}

[[ -d "$target" ]] || {
	printf 'Stow target does not exist: %s\n' "$target" >&2
	exit 1
}

cd "$repository_root"
stow --restow --target "$target" local theme-switcher

theme_command="$target/.local/bin/theme"
[[ -x "$theme_command" ]] || {
	printf 'Theme command was not linked: %s\n' "$theme_command" >&2
	exit 1
}

printf 'Theme switcher installed. Run: %s set mocha\n' "$theme_command"
