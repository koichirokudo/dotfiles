#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_package_manager() {
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
    # install yay paru
    $(password) | echo "$password" | sudo -S pacman -S --noconfirm --needed go git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ~
    rm -rf ~/yay
    yay -Syu
  fi
}

