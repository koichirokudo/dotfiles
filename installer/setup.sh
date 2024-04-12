#!/usr/bin/env bash
set -ue

#-----------------------------------------------------#
# Main                                                #
#-----------------------------------------------------#

function main () {
  command echo ""
  command echo "#####################################################"
  command echo -e "\e[1;36m $(basename $0) start \e[m"
  command echo "#####################################################"
  command echo ""
  local current_dir
  current_dir=$(dirname "${BASH_SOURCE[0]:-$0}")
  source $current_dir/utils.sh

  # install
  source $current_dir/install-package-manager.sh
  source $current_dir/install-gui.sh
  source $current_dir/install-hyprland.sh
  source $current_dir/install-fonts.sh
  source $current_dir/install-fcitx.sh
  source $current_dir/install-apps.sh
  source $current_dir/install-docker.sh
  source $current_dir/install-zsh.sh
  source $current_dir/install-dotfiles.sh

  command echo ""
  command echo "#####################################################"
  command echo -e "\e[1;36m $(basename $0) install success \e[m"
  command echo "#####################################################"
  command echo ""
}

main
