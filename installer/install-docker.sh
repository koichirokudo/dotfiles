#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_docker () {
  command echo ""
  command echo -e "Running... $(basename $0)"
  command echo ""
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
    yay -S --noconfirm --needed docker docker-compose
    sudo -S usermod -aG docker $USER
    if [ -d /sda ] && [ ! -d /sda/docker ]; then
      mkdir -p /sda/docker
      sudo mkdir -p /etc/docker
      sudo echo <<EOF | sudo tee /etc/docker/daemon.json
      {
        "data-root": "/sda/docker/docker"
      }
      EOF
    fi
    sudo -S systemctl enable docker
  elif [[ $distro == "ubuntu" ]]; then
    :
  fi
  command echo ""
  command echo -e "Done... $(basename $0)"
  command echo ""
}

install_docker
