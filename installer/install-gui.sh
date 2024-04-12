#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_gui () {
  command echo ""
  command echo -e "Running... $(basename $0)"
  command echo ""
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
    yay -S --noconfirm --needed acpid xorg lightdm
    sudo -S systemctl enable lightdm
  elif [[ $distro == "ubuntu" ]]; then
    :
  fi
  command echo ""
  command echo -e "Done... $(basename $0)"
  command echo ""
}

install_gui
