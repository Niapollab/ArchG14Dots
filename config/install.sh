#!/bin/sh

# Stop execution on error
set -e

# Determine script dir (see https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script)
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Installation switch-case
case "$1" in

  alacritty)
    SOURCE="$SCRIPT_DIR/alacritty"
    TARGET="/home/`whoami`/.config/alacritty"

    rm -rf "$TARGET"
    ln -s "$SOURCE" "$TARGET"
    ;;

  fusuma)
    SOURCE="$SCRIPT_DIR/fusuma"
    TARGET="/home/`whoami`/.config/fusuma"

    rm -rf "$TARGET"
    ln -s "$SOURCE" "$TARGET"
    ;;

  git)
    SOURCE="$SCRIPT_DIR/git/.gitconfig"
    TARGET="/home/`whoami`/.gitconfig"

    rm -rf "$TARGET"
    ln -s "$SOURCE" "$TARGET"
    ;;

  zsh)
    SOURCE="$SCRIPT_DIR/zsh/.zshrc"
    TARGET="/home/`whoami`/.zshrc"

    rm -rf "$TARGET"
    ln -s "$SOURCE" "$TARGET"
    ;;

  *)
    echo "[!] Unable to install config \"$1\"."
    exit 1
    ;;
esac

echo "[*] Installed \"$1\" config."
exit 0
