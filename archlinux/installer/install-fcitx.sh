#!/usr/bin/env bash
set -ue

source "$(dirname "${BASH_SOURCE[0]:-$0}")"/utils.sh

function install_fcitx() {
  command echo ""
  command echo -e "Running... $(basename $0)"
  command echo ""

  yay -S --noconfirm --needed fcitx5-im fcitx5-mozc

  command echo ""
  command echo -e "Done... $(basename $0)"
  command echo ""
}

install_fcitx
