#!/usr/bin/env sh

# prevent shellcheck from caring about $chosen being parsed as data in printf
# that is intentional behavior, because it needs to parse the newlines before
# handing stdout over to rofi.

# tldr fuck off shellcheck

# shellcheck disable=SC2059


choices="Abort\nLock\nClose Current Session\nShutdown\nReboot"
chosen=$(printf "$choices" | rofi -theme "$HOME/.cry/rofi/cry.rasi" -dmenu -i)
case "$chosen" in
	Abort) ;;
	Lock) exec $HOME/.cry/scripts/locker/lock.sh ;;
	"Close Current Session") i3-msg exit ;;
	Shutdown)  sudo poweroff ;;
	Reboot)  sudo reboot ;;
esac
