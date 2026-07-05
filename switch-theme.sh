#!/usr/bin/env bash
# Switch the active kitty config variant.
# Usage: switch-theme.sh <minimal|catppuccin-eyecandy|catppuccin-frappe|catppuccin-macchiato|catppuccin-latte|gruvbox-productivity|nord-clean>
set -euo pipefail

configs_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/configs"
name="${1:-}"
target="$configs_dir/$name.conf"

if [[ -z "$name" || ! -f "$target" ]]; then
    echo "Usage: $0 <theme>"
    echo "Available themes:"
    for f in "$configs_dir"/*.conf; do
        base="$(basename "$f" .conf)"
        [[ "$base" == "original-backup" || "$base" == "active" ]] && continue
        echo "  - $base"
    done
    exit 1
fi

ln -sf "$name.conf" "$configs_dir/active.conf"

# Point platform.conf at the file for the current OS so the font (and macOS
# key handling) is right on whichever machine this repo is checked out on.
case "$(uname -s)" in
    Darwin) platform=macos ;;
    *)      platform=linux ;;
esac
ln -sf "platform-$platform.conf" "$configs_dir/platform.conf"

echo "Switched to '$name' (platform: $platform). Reload with ctrl+shift+F5 in kitty, or restart it."
