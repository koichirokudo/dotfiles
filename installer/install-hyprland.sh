#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_hyprland () {
  command echo ""
  command echo -e "Running... $(basename $0)"
  command echo ""
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
		ysy -S --noconfirm --needed hyprland hyprpaper waybar \
    hypridle hyprlock hyprcursor hyprlang \
    xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
	elif [[ $distro == "ubuntu" ]]; then
		:
	fi
  command echo ""
  command echo -e "Done... $(basename $0)"
  command echo ""
}

install_hyprland

