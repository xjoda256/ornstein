#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty)" == "/dev/tty1" ]] && ! pgrep -x Hyprland &>/dev/null; then
  read -p "Start Hyprland? [Y/n] " -n 1 -r
  echo
  if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ -z "$REPLY" ]]; then
    exec Hyprland
  fi
fi
