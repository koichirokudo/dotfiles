#!/usr/bin/env bash
set -ue

source "$(dirname "${BASH_SOURCE[0]:-$0}")"/utils.sh

function install_zsh () {
  yay -S --noconfirm --needed zsh
  sudo chsh -s /bin/zsh "$USER"
}
