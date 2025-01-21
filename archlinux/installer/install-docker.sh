#!/usr/bin/env bash
set -ue

source "$(dirname "${BASH_SOURCE[0]:-$0}")"/utils.sh

function install_docker () {
  command echo ""
  command echo -e "Running... $(basename "$0")"
  command echo ""
    yay -S --noconfirm --needed docker docker-compose
    sudo -S usermod -aG docker "$USER"
    if [ -d /sda ] && [ ! -d /sda/docker ]; then
      mkdir -p /sda/docker
      sudo mkdir -p /etc/docker
      if [[ ! -f /etc/docker/daemon.json ]]; then
      sudo tee /etc/docker/daemon.json > /dev/null <<EOF
{
  "data-root": "/sda/docker/docker"
}
EOF
      else
        echo "Warning: /etc/docker/daemon.json already exists. Skipping creation."
      fi
    fi
    sudo -S systemctl enable docker
  command echo ""
  command echo -e "Done... $(basename "$0")"
  command echo ""
}

install_docker
