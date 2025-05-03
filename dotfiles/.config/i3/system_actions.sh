#!/bin/bash

choices="Lock\nLogout\nReboot\nShutdown"
action=$(echo -e "$choices" | rofi -dmenu -p "Choose action")

case "$action" in
  Lock)
    loginctl lock-session ;;
  Reboot)
    systemctl reboot ;;
  Shutdown)
    systemctl poweroff ;;
  Logout)
    i3-msg exit ;;
  *)
    exit 1 ;;
esac

