#!/usr/bin/env bash
set -uex

function install_package_manager() {
  command echo ""
  command echo -e "Running... $(basename $0)"
  command echo ""
  local current_dir="$(cd "$(dirname "$0")" && pwd)"

  # 一般ユーザーを作成
  if ! id -u builder &>/dev/null; then
    useradd -m builder
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
  fi

  # install yay
  sudo -S pacman -S --noconfirm --needed go git base-devel debugedit fakeroot
  if which yay &>/dev/null; then
    command echo "yay is installed."
  else
   # 一般ユーザーで yay をビルド
    sudo -u builder bash -c "
      mkdir -p ~/builds &&
      cd ~/builds &&
      git clone https://aur.archlinux.org/yay.git &&
      cd yay &&
      makepkg -si --noconfirm
    "
    rm -rf ~/yay
    cd "$current_dir"
  fi

  yay -Syyu --noconfirm --answerclean None 2>/dev/null

  command echo ""
  command echo -e "Done... $(basename $0)"
  command echo ""
}

install_package_manager
