#!/usr/bin/env bash
set -ue

#-----------------------------------------------------#
# Functions                                           #
#-----------------------------------------------------#

IGNORE_FILES="^\.(git|ssh|aws|travis|gitconfig|gitconfig-works|gitconfig-private)"

help_message() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

link_to_homedir() {
  command echo ""
  command echo -e "Running... $(basename "$0")"
  command echo ""
  command echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dot_backup" ];then
    command echo "$HOME/.dot_backup not found. Auto Make it"
    command mkdir "$HOME/.dot_backup"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname "${script_dir}")

  if [[ "$HOME" != "$dotdir" ]];then
    for f in "$dotdir"/.??*; do
      [[ `basename $f` =~ $IGNORE_FILES ]] && continue
      if [[ -L "$HOME/`basename $f`" ]];then
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" "$HOME/.dot_backup"
      fi
      command ln -snf "$f" "$HOME"
    done
  else
    command echo "same install src dest"
  fi
}


#-----------------------------------------------------#
# Main                                                #
#-----------------------------------------------------#

IS_INSTALL="true"

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      help_message
      exit 1
      ;;
    install)
      IS_INSTALL="true"
      ;;
    *)
      ;;
  esac
  shift
done

if [[ "$IS_INSTALL" = true ]];then
  link_to_homedir
  command echo ""
  command echo -e "Done... $(basename "$0")"
  command echo ""
fi
