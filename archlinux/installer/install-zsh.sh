#!/usr/bin/env bash
set -ue

function install_zsh () {
  yay -S --noconfirm --needed zsh
  sudo chsh -s /bin/zsh "$USER"
}
