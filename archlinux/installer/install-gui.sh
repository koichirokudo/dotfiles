#!/usr/bin/env bash
set -ue

function install_gui () {
  command echo ""
  command echo -e "Running... $(basename "$0")"
  command echo ""

  yay -S --noconfirm --needed acpid xorg lightdm
  sudo -S systemctl enable lightdm

  command echo ""
  command echo -e "Done... $(basename "$0")"
  command echo ""
}

install_gui
