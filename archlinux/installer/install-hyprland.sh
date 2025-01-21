#!/usr/bin/env bash
set -ue

function install_hyprland () {
  command echo ""
  command echo -e "Running... $(basename "$0")"
  command echo ""

  yay -S --noconfirm --needed hyprland hyprpaper waybar \
  hypridle hyprlock hyprcursor hyprlang \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

  command echo ""
  command echo -e "Done... $(basename "$0")"
  command echo ""
}

install_hyprland

