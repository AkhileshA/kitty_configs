#!/bin/sh
# Bound to F11: toggle OS window fullscreen and, in lockstep, flip the
# background between fully opaque and the active theme's opacity.
# --toggle compares against 1.0 and falls back to the theme's configured
# background_opacity when already opaque, so no external state is kept.
kitty @ action toggle_fullscreen
kitty @ set-background-opacity --all --toggle 1.0
