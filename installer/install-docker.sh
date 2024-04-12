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
      cp -ar /var/lib/docker /sda/docker/
      sudo -S sed -i '/ExecStart/s/$/ --data-root \/sda\/docker/' /lib/systemd/system/docker.service
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
