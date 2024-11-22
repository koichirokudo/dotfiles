#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_zsh () {
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
    yay -S --noconfirm --needed zsh
    sudo -S chsh -s /bin/zsh
  elif [[ $distro == "ubuntu" ]]; then
    :
  fi
}
