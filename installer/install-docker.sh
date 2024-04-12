#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_docker () {
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
		yay -S --noconfirm --needed docker docker-compose
    echo "$password" | sudo -S usermod -aG docker $USER
    if [ ! -d /sda/docker ]; then
      mkdir -p /sda/docker
    fi
    cp -ar /var/lib/docker /sda/docker/
    echo "$password" | sudo -S sed -i '/ExecStart/s/$/ --data-root \/sda\/docker/' \
      /lib/systemd/system/docker.service
    echo "$password" | sudo -S systemctl enable docker
	elif [[ $distro == "ubuntu" ]]; then
		:
	fi
}
