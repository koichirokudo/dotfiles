#!/usr/bin/env bash
set -ue

#-----------------------------------------------------#
# Functions                                           #
#-----------------------------------------------------#

IGNORE_FILES="^\.(git|ssh|aws|travis|gitconfig(|-works|-private))$"

help_message() {
  command echo "Usage: $0 [options]"
  command echo ""
  command echo "Options:"
  command echo "  --help, -h        Show this help message and exit"
  command echo "  --debug, -d       Enable debug mode (set -x)"
  command echo "  install           Link dotfiles to the home directory"
  command echo ""
  command echo "Example:"
  command echo "  $0 install"
}

link_to_homedir() {
  command echo "[INFO] Running... $(basename "$0")"
  command echo "[INFO] Backing up old dotfiles..."

  if [ ! -d "$HOME/.dot_backup" ]; then
    command echo "[INFO] Creating backup directory at $HOME/.dot_backup"
    command mkdir "$HOME/.dot_backup"
  fi

  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  dot_dir=$(realpath "${script_dir}/../../common/config")

  # common config directory
  if [[ "$HOME" != "$dot_dir" ]]; then
    for f in "$dot_dir"/.??*; do
      [[ $(basename "$f") =~ $IGNORE_FILES ]] && continue

      if [[ -L "$HOME/$(basename "$f")" ]]; then
        command echo "[INFO] Removing existing symlink: $HOME/$(basename "$f")"
        command rm -f "$HOME/$(basename "$f")"
      fi

      if [[ -e "$HOME/$(basename "$f")" ]]; then
        timestamp=$(date +"%Y%m%d%H%M%S")
        command mv "$HOME/$(basename "$f")" "$HOME/.dot_backup/$(basename "$f").$timestamp"
        command echo "[INFO] Backed up $(basename "$f") as $(basename "$f").$timestamp"
      fi

      command ln -snf "$f" "$HOME"
      command echo "[INFO] Linked $f to $HOME"
    done
  else
    command echo "[WARNING] Source and destination are the same. No changes made."
  fi

  # arch linux config directory
  dot_dir=$(realpath "${script_dir}/../config")
  if [[ "$HOME" != "$dot_dir" ]]; then
    for f in "$dot_dir"/.??*; do
      [[ $(basename "$f") =~ $IGNORE_FILES ]] && continue

      if [[ -L "$HOME/$(basename "$f")" ]]; then
        command echo "[INFO] Removing existing symlink: $HOME/$(basename "$f")"
        command rm -f "$HOME/$(basename "$f")"
      fi

      if [[ -e "$HOME/$(basename "$f")" ]]; then
        timestamp=$(date +"%Y%m%d%H%M%S")
        command mv "$HOME/$(basename "$f")" "$HOME/.dot_backup/$(basename "$f").$timestamp"
        command echo "[INFO] Backed up $(basename "$f") as $(basename "$f").$timestamp"
      fi

      command ln -snf "$f" "$HOME"
      command echo "[INFO] Linked $f to $HOME"
    done
  else
    command echo "[WARNING] Source and destination are the same. No changes made."
  fi
}

#-----------------------------------------------------#
# Main                                                #
#-----------------------------------------------------#

IS_INSTALL="false"

while [ $# -gt 0 ]; do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      help_message
      exit 0
      ;;
    install)
      IS_INSTALL="true"
      ;;
    *)
      command echo "[ERROR] Unknown option: $1"
      help_message
      exit 1
      ;;
  esac
  shift
done

link_to_homedir install

if [[ "$IS_INSTALL" = true ]]; then
  command echo -e "[INFO] All dotfiles linked successfully."
fi
