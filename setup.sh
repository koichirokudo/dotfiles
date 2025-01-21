#!/bin/bash
set -e

# 現在のスクリプトのディレクトリを取得
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
echo "Detected OS: $(uname -s | tr '[:upper:]' '[:lower:]')"

case "$(uname -s | tr '[:upper:]' '[:lower:]')" in
  linux)
    if [ -f /etc/arch-release ]; then
      bash "$SCRIPT_DIR/archlinux/installer/installer.sh"
    else
      echo "Unsupported Linux distribution."
      exit 1
    fi
    ;;
  darwin)
    bash "$SCRIPT_DIR/macos/installer/installer.sh"
    ;;
  *)
    echo "Unsupported OS: $(uname -s)"
    exit 1
    ;;
esac
