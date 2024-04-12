#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_gui () {
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
		yay -S --noconfirm --needed acpid xorg lightdm
    echo "$password" | sudo -S systemctl enable lightdm
	elif [[ $distro == "ubuntu" ]]; then
		:
	fi
}
