#!/bin/sh

_restore_awww() {
  if command -v awww >/dev/null; then
    pgrep -x awww-daemon >/dev/null || awww-daemon >/dev/null 2>&1 &
    sleep 0.1
    awww restore
    echo "hyprland detected"
    export BG_ENGINE="awww"
  fi
}

_restore_nitrogen() {
  if command -v nitrogen >/dev/null; then
    nitrogen --restore &
    export BG_ENGINE="nitrogen"
  fi
}

_restore_feh() {
  if [ -f "$HOME/.fehbg" ]; then
    . "$HOME/.fehbg"
    export BG_ENGINE="feh"
  fi
}

main() {
  _desktop_env=$(printf "%s" "$XDG_CURRENT_DESKTOP" | tr '[:upper:]' '[:lower:]')

  case "$_desktop_env" in
  *hyprland*) _restore_awww ;;
  *i3*) _restore_feh ;;
  *) ;;
  esac

  unset _desktop_env

  # Push BG_ENGINE to the session-wide environment
  if [ -n "$BG_ENGINE" ]; then
    dbus-update-activation-environment --systemd BG_ENGINE
  fi
}

main "$@"
