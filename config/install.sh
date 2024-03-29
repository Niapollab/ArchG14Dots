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

    read -p "[@] Specify username: " GIT_USERNAME
    sed -i "s#\(name\s*=\s*\).*#\1$GIT_USERNAME#g" "$SOURCE"

    read -p "[@] Specify username: " GIT_EMAIL
    sed -i "s#\(email\s*=\s*\).*#\1$GIT_EMAIL#g" "$SOURCE"

    read -p "[@] Specify path to public key (use ssh-keygen): " GIT_PRIVATE_KEY
    sed -i "s#\(signingKey\s*=\s*\).*#\1$GIT_PRIVATE_KEY#g" "$SOURCE"

    rm -rf "$TARGET"
    ln -s "$SOURCE" "$TARGET"
    ;;

  zsh)
    SOURCE="$SCRIPT_DIR/zsh"
    TARGET="/home/`whoami`"

    RC_SOURCE="$SOURCE/.zshrc"
    RC_TARGET="$TARGET/.zshrc"

    ALIASES_SOURCE="$SOURCE/.zsh_aliases"
    ALIASES_TARGET="$TARGET/.zsh_aliases"

    rm -rf "$RC_TARGET"
    ln -s "$RC_SOURCE" "$RC_TARGET"

    rm -rf "$ALIASES_TARGET"
    ln -s "$ALIASES_SOURCE" "$ALIASES_TARGET"
    ;;

  waybar)
    SOURCE="$SCRIPT_DIR/waybar"
    TARGET="/home/`whoami`/.config/waybar"

    read -p "[@] Input keyboard name (use hyprctl devices): " KEYBOARD_NAME
    echo "$KEYBOARD_NAME" > "$SOURCE/keyboard-name"

    rm -rf "$TARGET"
    ln -s "$SOURCE" "$TARGET"
    ;;

  vscode)
    SOURCE="$SCRIPT_DIR/vscode"
    TARGET="/home/`whoami`/.config/Code/User"

    SETTINGS_SOURCE="$SOURCE/settings.json"
    SETTINGS_TARGET="$TARGET/settings.json"

    KEYBINDINGS_SOURCE="$SOURCE/keybindings.json"
    KEYBINDINGS_TARGET="$TARGET/keybindings.json"

    SNIPPETS_SOURCE="$SOURCE/snippets"
    SNIPPETS_TARGET="$TARGET/snippets"

    EXTENSIONS="$SCRIPT_DIR/vscode/extensions.txt"

    cat "$EXTENSIONS" | xargs -n 1 code --install-extension

    rm -rf "$SETTINGS_TARGET"
    ln -s "$SETTINGS_SOURCE" "$SETTINGS_TARGET"

    rm -rf "$KEYBINDINGS_TARGET"
    ln -s "$KEYBINDINGS_SOURCE" "$KEYBINDINGS_TARGET"

    rm -rf "$SNIPPETS_TARGET"
    ln -s "$SNIPPETS_SOURCE" "$SNIPPETS_TARGET"
    ;;

  zsh-autosuggestions | zsh-syntax-highlighting)
    SOURCE="/usr/share/zsh/plugins/$1"
    TARGET="/home/`whoami`/.oh-my-zsh/plugins/$1"

    rm -rf "$TARGET"
    ln -s "$SOURCE" "$TARGET"
    ;;

  mako)
    SOURCE="$SCRIPT_DIR/mako"
    TARGET="/home/`whoami`/.config/mako"

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
