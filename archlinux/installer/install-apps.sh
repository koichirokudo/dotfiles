#!/usr/bin/env bash
set -ue

source "$(dirname "${BASH_SOURCE[0]:-$0}")"/utils.sh

function install_apps () {
  command echo ""
  command echo -e "Running... $(basename $0)"
  command echo ""

  packages=$(cat packages.list)

  yay -S --noconfirm --needed "$packages"

  sudo mkdir -p /var/log/clamav
  sudo touch /var/log/clamav/freshclam.log
  sudo systemctl enable NetworkManager.service
  sudo systemctl enable ufw
  command echo ""
  command echo -e "Done... $(basename $0)"
  command echo ""
}

install_apps
