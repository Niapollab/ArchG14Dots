# Arch notes - Asus ROG Zephyrus G14 GA402XV

## Packages

### Pacman

* acpilight - brightness control
* alacritty - pseudoterminal emulator
* amd-ucode - patches for AMD processor
* android-tools - adb and fastboot support
* asusctl - Asus laptop device manager
* base - minimal package set to define a basic Arch Linux installation
* base-devel - basic tools to build Arch Linux packages
* blueman - GUI Bluetooth manager
* bluez - Bluetooth protocol
* bluez-utils - Bluetooth manager
* cliphist - history clipboard manager
* docker - containerization
* dotnet-host - .NET version manager
* dotnet-sdk - last .NET SDK
* ffmpeg - video converting
* gimp - raster image editor
* git - system of version controlling
* gnome-themes-extra - external gnome themes
* grim - screenshots utility
* hyprland - tiling desktop compositor
* hyprpaper - wallpaper manager
* less - pagination provider
* linux-firmware - firmware files for Linux
* linux-g14 - custom Asus G14 linux kernel
* linux-g14-headers - custom Asus G14 linux kernel headers
* mako - notifications support
* micro - CLI code editor
* nemo - file manager
* neofetch - rice information about system
* networkmanager - CLI tool for network connections managing
* noto-fonts-cjk - asian symbols support
* noto-fonts-emoji - emoji support
* nwg-look - theme editor for GTK
* obs - video and audio recording
* pavucontrol - GUI pipewire manager
* pipewire - sound server
* pipewire-alsa - kernel level sound mixer support
* pipewire-audio - Bluetooth headphones support
* pipewire-pulse - integration with PulseAudio API
* polkit-gnome - GUI agent for for controlling system-wide privileges
* pyenv - Python version manager
* rofi-emoji - emoji picker for Rofi
* rog-control-center - GUI for asusctl
* sddm - desktop display manager
* slurp - choose monitor region utility
* streamlink - media downloader
* sudo - superuser manager
* supergfxctl - GPU switcher
* terminus-font - TTY fonts with cyrillic support
* ttf-firacode-nerd - FiraCode Nerd font
* ttf-noto-nerd - Noto Nerd font
* vlc - video and audio player
* waybar - desktop bar
* wev - key codes provider
* wl-clipboard - copy and paste command line utilities
* xdg-desktop-portal-gtk - enable filechooser for gnome apps
* xdg-desktop-portal-hyprland - allows screen sharing features
* yay - AUR manager
* zerotier-one - VPN throw network utility
* zsh - shell
* zsh-autosuggestions - autosuggestions for shell
* zsh-completions - additional completion definitions
* zsh-syntax-highlighting - syntax highlighting for shell

### AUR

* ayugram-desktop-bin - Telegram client
* bibata-cursor-theme-bin - cursor theme
* brave-bin - browser
* ghidra.desktop - reverse-engineering tool
* imhex - hex editor
* p7zip-gui - 7Zip GUI
* rofi-lbonn-wayland - launcher menu
* ruby-fusuma - touchpad gestures manager
* ruby-fusuma-plugin-sendkey - send keys plugin for fusuma config support
* stegsolve - steganographic image analyzer
* visual-studio-code-bin - GUI code editor
* webcord - Discord with share screen ability
* wttrbar-git - module for showing the weather in Waybar

### Custom

* [Oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/)

## Services

* bluetooth.service - Bluetooth service
* docker.service - Docker service
* NetworkManager.service - NetworkManager service
* sddm.service - SDDM Service
* sshd.service - SSH Server service
* systemd-oomd.service - OOM killer service

## Environment

Bar: Waybar

Browser: Brave

Desktop compositor: Hyprland

Display manager: Sddm

Launcher menu: Rofi

Audio system: PipeWire

Notifications: Mako

Fonts:

* Desktop: NotoSansM Nerd Font Regular 11pt
* VSCode: FiraCode Nerd Font Mono Ret 14px

## Limit CPU

You can limit CPUs for some processes (for example for `yay`):

```shell
numactl --physcpubind=0-7 <process name and arguments>
```

## Fix Rofi drun execution issues

You can modify application `.desktop` file for custom launch parameters. Use it to find all of them:

```shell
find / -name "*.desktop" 2>/dev/null
```

## Make global GTK theme configurable

1. Add user to `theme` group:

    ```shell
    sudo groupadd theme
    sudo usermod -a -G theme `whoami`
    ```

2. Restart user session to apply changes

3. Make global theme configurable:

    ```shell
    sudo chown :theme /usr/share/icons/default/index.theme
    sudo chmod g+w /usr/share/icons/default/index.theme
    ```

4. Create symbolic link to user space:

    ```shell
    mkdir -p "/home/`whoami`/.icons/default/"
    ln -s "/usr/share/icons/default/index.theme" "/home/`whoami`/.icons/default/index.theme"
    ```

## Install text shrug to global rofi-emojis

1. Add user to `theme` group:

    ```shell
    sudo groupadd theme
    sudo usermod -a -G theme `whoami`
    ```

2. Restart user session to apply changes

3. Make global emojis configurable:

    ```shell
    sudo chown :theme /usr/share/rofi-emoji/all_emojis.txt
    sudo chmod g+w /usr/share/rofi-emoji/all_emojis.txt
    ```

4. Install custom shrug emoji for the srofi-emoji package:

    ```shell
    echo "¯\_(ツ)_/¯\tPlain text\tplain-text\tshrug\ttext | shrugging | shrug" >> /usr/share/rofi-emoji/all_emojis.txt
    ```

## Change the default terminal emulator for Nemo to alacritty

gnome-terminal is set as the default, if it is not installed, neither the "Open in terminal" context menu entry feature will not work, nor shell scripts or terminal applications will not run from Nemo.

You can change the default setting with gsettings to the alacritty.

```shell
gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty
```

### Make Docker volume accessible for Linux local user

1. Set a custom rights mask for the volume directory:

    ```shell
    setfacl -d -m g::rwx /<volume directory>
    ```

2. Launch the container with flag `--user :$(id -g)`.
