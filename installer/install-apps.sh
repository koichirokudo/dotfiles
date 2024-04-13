#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_apps () {
  command echo ""
  command echo -e "Running... $(basename $0)"
  command echo ""
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
    yay -S --noconfirm --needed vim neovim bat vgrep pamixer php nodejs \
      man pavucontrol polkit-gnome python-requests grimshot spotify-launcher \
      firefox chromium microsoft-edge-stable gufw clamav clamtk thunar \
      dracula-icons-git dracula-gtk-theme fzf starship tmux feh ranger
  elif [[ $distro == "ubuntu" ]]; then
    :
  fi
  command echo ""
  command echo -e "Done... $(basename $0)"
  command echo ""
}

install_apps
