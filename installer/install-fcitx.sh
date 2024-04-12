#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_fcitx () {
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
		yay -S --noconfirm --needed fcitx5-im fcitx5-mozc
    echo "$password" | sudo -S chsh -s /bin/zsh
	elif [[ $distro == "ubuntu" ]]; then
		:
	fi
}
