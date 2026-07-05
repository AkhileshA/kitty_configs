#!/bin/sh
# Fire a KWin window action (by its kglobalaccel name, e.g. "Window
# Fullscreen" or "Window Minimize") on the currently active window.
#
# We go through KWin rather than kitty's own window actions because on
# KDE/Wayland kitty's internal toggle_fullscreen does not register as a
# true compositor fullscreen, so the Always-Visible Plasma panel and the
# window titlebar stay drawn on top. KWin's own fullscreen hides both.
gdbus call --session \
  --dest org.kde.kglobalaccel \
  --object-path /component/kwin \
  --method org.kde.kglobalaccel.Component.invokeShortcut \
  "$1" >/dev/null 2>&1
