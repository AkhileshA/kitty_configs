#!/bin/sh
# Bound to F11: toggle real (KWin) fullscreen so the Plasma panel and the
# window titlebar are hidden, and in lockstep flip the background between
# fully opaque and the active theme's opacity.
# --toggle compares against 1.0 and falls back to the theme's configured
# background_opacity when already opaque, so no external state is kept.
~/.config/kitty/kwin-action.sh "Window Fullscreen"
kitty @ set-background-opacity --all --toggle 1.0
