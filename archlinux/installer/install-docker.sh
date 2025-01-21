#!/usr/bin/env bash
set -ue

is_docker() {
  if grep -qE '(docker|lxc)' /proc/1/cgroup 2>/dev/null; then
    return 1  # Docker コンテナ内
  else
    return 0  # 通常の環境
  fi
}

function install_docker () {
  command echo ""
  command echo -e "Running... $(basename "$0")"
  command echo ""
  if ! is_docker ; then
    echo "install docker"
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
  else
    echo "Skipping install_docker setup"
  fi
  command echo ""
  command echo -e "Done... $(basename "$0")"
  command echo ""
}

install_docker
