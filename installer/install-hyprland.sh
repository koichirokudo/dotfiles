#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_hyprland () {
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
		ysy -S --noconfirm --needed hyprland hyprpaper waybar \
    hypridle hyprlock hyprcursor hyprlang \
    xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
	elif [[ $distro == "ubuntu" ]]; then
		:
	fi
}

