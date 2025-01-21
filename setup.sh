#!/bin/bash
set -e

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
echo "Detected OS: $OS"

case "$OS" in
  linux)
    if [ -f /etc/arch-release ]; then
      bash ./archlinux/installer/installer.sh
    else
      echo "Unsupported Linux distribution."
      exit 1
    fi
    ;;
  darwin)
    bash ./macos/installer/installer.sh
    ;;
  *)
    echo "Unsupported OS: $OS"
    exit 1
    ;;
esac
