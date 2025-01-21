#!/usr/bin/env bash
set -ue

source "$(dirname "${BASH_SOURCE[0]:-$0}")"/utils.sh

function install_fonts() {
  command echo ""
  command echo -e "Running... $(basename $0)"
  command echo ""
  local current_dir="$(cd "$(dirname "$0")" && pwd)"

  yay -S --noconfirm --needed noto-fonts-cjk ttf-jetbrains-mono-nerd \
    noto-fonts-emoji ipa-fonts
  if ! (ls /usr/share/fonts/TTF/) | grep -qE '^(Mplus|MPLUS)'; then
    cd /var/tmp
    git clone https://github.com/coz-m/MPLUS_FONTS.git
    sudo mv MPLUS_FONTS/fonts/ttf/* /usr/share/fonts/TTF/
    rm -rf MPLUS_FONTS
    cd "$current_dir"
  fi

  command echo ""
  command echo -e "Done... $(basename $0)"
  command echo ""
}

install_fonts
