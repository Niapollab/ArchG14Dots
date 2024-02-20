# Arch notes - Asus ROG Zephyrus G14 GA402XV

## Packages

### Pacman

* acpilight - brightness control
* amd-ucode - patches for AMD processor
* asusctl - Asus laptop device manager
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
* hyprland - tiling desktop compositor
* hyprpaper - wallpaper manager
* less - pagination provider
* micro - CLI code editor
* nemo - file manager
* neofetch - rice information about system
* networkmanager - CLI tool for network connections managing
* noto-fonts-cjk - asian symbols support
* noto-fonts-emoji - emoji support
* nwg-look - theme editor for GTK
* pavucontrol - GUI pulseaudio manager
* polkit-gnome - GUI agent for for controlling system-wide privileges
* pulseaudio - sound server
* pulseaudio-alsa - kernel level sound mixer support
* pulseaudio-bluetooth - Bluetooth headphones support
* pyenv - Python version manager
* rog-control-center - GUI for asusctl
* sddm - desktop display manager
* streamlink - media downloader
* sudo - superuser manager
* supergfxctl - GPU switcher
* terminus-font - TTY fonts with cyrillic support
* ttf-firacode-nerd - FiraCode Nerd font
* ttf-noto-nerd - Noto Nerd font
* vlc - video and audio player
* waybar - desktop bar
* wl-clipboard - copy and paste command line utilities
* yay - AUR manager
* zsh - shell
* zsh-autosuggestions - autosuggestions for shell
* zsh-completions - additional completion definitions
* zsh-syntax-highlighting - syntax highlighting for shell

### AUR

* ayugram-desktop-bin - Telegram client
* bibata-cursor-theme-bin - cursor theme
* brave-bin - browser
* rofi-lbonn-wayland - launcher menu
* ruby-fusuma - touchpad gestures manager
* ruby-fusuma-plugin-sendkey - send keys plugin for fusuma config support
* visual-studio-code-bin - GUI code editor
* wttrbar-git - module for showing the weather in Waybar

### Custom

* [Oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/)

## Environment

Bar: Waybar

Browser: Brave

Desktop compositor: Hyprland

Display manager: Sddm

Launcher menu: Rofi

Audio system: PulseAudio

Fonts:

* Desktop: NotoSansM Nerd Font Regular 11pt
* VSCode: FiraCode Nerd Font Mono Ret 14px

## Start OOM Killer service

OOM Killer service isn't started by default. Use to start it manually:

```shell
systemctl enable --now systemd-oomd.service
```

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

## Bluetooth service

Bluetooth service isn't started by default. Use to start it manually:

```shell
systemctl enable --now bluetooth.service
```
