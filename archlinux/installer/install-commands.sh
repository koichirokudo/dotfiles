#!/usr/bin/env bash
set -ue

function install_commands () {
  command echo ""
  command echo -e "Running... $(basename $0)"
  command echo ""

  yay -S --noconfirm --needed bat fd delta lsd ripgrep grex vgrep silicon \
    xsv csview bandwhich starship fzf htop iftop go-task

  command echo ""
  command echo -e "Done... $(basename $0)"
  command echo ""
}

install_commands
