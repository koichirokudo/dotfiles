#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_apps () {
  command echo ""
  command echo -e "Running... $(basename $0)"
  command echo ""
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
    yay -S --noconfirm --needed vim neovim pamixer php nodejs networkmanager \
      man pavucontrol polkit-gnome python-requests grimshot spotify-launcher \
      firefox chromium microsoft-edge-stable vivaldi ufw clamav clamtk thunar \
      tmux feh ranger dnsutils mutt cliphist wofi gvfs npm typescript-language-server \
      grex csview git-delta python-pip php composer php-gd php-intl notion-app-electron \
      discord slack-desktop
    sudo mkdir -p /var/log/clamav
    sudo touch /var/log/clamav/freshclam.log
    sudo systemctl enable NetworkManager.service
    sudo systemctl enable ufw
  elif [[ $distro == "ubuntu" ]]; then
    :
  fi
  command echo ""
  command echo -e "Done... $(basename $0)"
  command echo ""
}

install_apps
