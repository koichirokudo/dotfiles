#!/usr/bin/env bash
set -ue

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

function install_fonts() {
  local distro=$(whichdistro)
  if [[ $distro == "arch" ]]; then
    yay -S --noconfirm --needed noto-fonts-cjk ttf-jetbrains-mono-nerd \
      noto-fonts-emoji ipa-fonts
    cd /tmp/
    git clone https://github.com/coz-m/MPLUS_FONTS.git
    mv MPLUS_FONTS/fonts/ttf/* /usr/share/fonts/TTF/
    rm -rf MPLUS_FONTS
  elif [[ $distro == "ubuntu" ]]; then
    :
  if
}

