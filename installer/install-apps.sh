#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_apps () {
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
		yay -S --noconfirm --needed vim neovim bat vgrep pamixer php nodejs \
      man pavucontrol polkit-gnome python-requests grimshot spotify \
      firefox chromium microsoft-edge-stable gufw clamav clamtk thunar \
      dracula-icons-git dracula-gtk-theme 
	elif [[ $distro == "ubuntu" ]]; then
		:
	fi
}

