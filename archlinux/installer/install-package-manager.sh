#!/usr/bin/env bash
set -uex

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_package_manager() {
  command echo ""
  command echo -e "Running... $(basename $0)"
  command echo ""
  local distro=$(whichdistro)
  local current_dir="$(cd "$(dirname "$0")" && pwd)"
  if [[ $distro == "arch" ]]; then
    # install yay paru
    sudo -S pacman -S --noconfirm --needed go git base-devel debugedit fakeroot
    if which yay &>/dev/null; then
      command echo "yay is installed."
    else
      cd /var/tmp
      git clone https://aur.archlinux.org/yay.git
      cd yay
      makepkg -si
      rm -rf ~/yay
      cd $current_dir
    fi
      yay -Syyu
  fi
  command echo ""
  command echo -e "Done... $(basename $0)"
  command echo ""
}

install_package_manager
