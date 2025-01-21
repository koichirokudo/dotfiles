#!/usr/bin/env bash
set -ue

is_docker() {
  if grep -qE '(docker|lxc)' /proc/1/cgroup 2>/dev/null; then
    return 1  # Docker コンテナ内
  else
    return 0  # 通常の環境
  fi
}

function install_apps () {
  command echo ""
  command echo -e "Running... $(basename $0)"
  command echo ""

  packages=$(cat packages.list)

  yay -S --noconfirm --needed "$packages"

  sudo mkdir -p /var/log/clamav
  sudo touch /var/log/clamav/freshclam.log
  if ! is_docker ; then
    echo "Enabling NetworkManager.service..."
    sudo systemctl enable NetworkManager.service
    sudo systemctl enable ufw
  else
    echo "Skipping NetworkManager.service setup (running inside a Docker container)."
  fi

  command echo ""
  command echo -e "Done... $(basename $0)"
  command echo ""
}

install_apps
