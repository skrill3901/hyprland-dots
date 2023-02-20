# 🌌 Hyprland Dotfiles

![Screenshot 1](https://raw.githubusercontent.com/gasech/hyprland-dots/main/assets/screenshot1.png)
![Screenshot 2](https://raw.githubusercontent.com/gasech/hyprland-dots/main/assets/screenshot2.png)
![Screenshot 3](https://raw.githubusercontent.com/gasech/hyprland-dots/main/assets/screenshot3.png)

## Sections
<!-- vim-markdown-toc Marked -->

* [Requirements](#requirements)
* [Installation Guide](#installation-guide)
  * [Yay (AUR Helper)](#yay-(aur-helper))
  * [Hyprland and Dependencies](#hyprland-and-dependencies)
  * [Packages](#packages)
  * [Zsh shell with Zap](#zsh-shell-with-zap)
  * [Copying config with Stow](#copying-config-with-stow)
  * [Downloading a Nerd Font](#downloading-a-nerd-font)
  * [GTK-XFCE Theme and Icons](#gtk-xfce-theme-and-icons)
* [Credits](#credits)

<!-- vim-markdown-toc -->

## Requirements
* Fresh installed Arch Linux 
* Archinstall with Sway Profile and Pipewire

> Pipewire is required, screen sharing won't work without it.

## Installation Guide 
> **Warning** 
>
> This installation guide is for my future self. Some steps might not be completed, updated or even tested. Proceed if you know what you are doing.

### Yay (AUR Helper)
This part is optional, you can use pacman or paru, I like yay.

```bash
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
# delete yay files after the completion (optional) 
cd .. && rm -rf yay
```

### Hyprland and Dependencies
Please read this before installing if you are using a [Nvidia GPU](https://wiki.hyprland.org/Nvidia/) 

This installation is going to take a while depending on your system.

| Type | Package(s) |
|-|--|
| Hyprland + Wayland  | hyprland-git |
| QT Wayland Support | qt5-wayland qt6-wayland |
| Status Bar  |  waybar-hyprland-git |
| Wallpaper |  hyprpaper-git |
| XDG Desktop Portal  | xdg-desktop-portal-hyprland-git  |

```bash
yay -S hyprland-git hyprpaper-git qt5-wayland qt6-wayland waybar-hyprland-git xdg-desktop-portal-hyprland-git
```

Create a wrapper to execute Hyprland 

```bash 
vim ~/.local/bin/wrappedhl
```

Inside *wrappedh1*
```bash
#!/bin/sh

cd ~
# uncomment the next two lines if you are installing in a virtual machine.
# export WLR_NO_HARDWARE_CURSORS=1
# export WLR_RENDERER_ALLOW_SOFTWARE=1

# log WLR errors and logs to the hyprland log, usually recommended
export HYPRLAND_LOG_WLR=1

# tell XWayland to use a cursor theme
export XCURSOR_THEME=Bibata-Modern-Classic

# set a cursor size
export XCURSOR_SIZE=24

exec Hyprland
```

Now you can execute `wrappedh1` and Hyprland should start "normally" with its default settings. 

You can stop the script by pressing `Super + M` or open kitty with `Super + Q`

### Packages 

| Type | Package(s)    |
|--------------- | --------------- |
| Audio  | pamixer pavucontrol pipewire-pulse |
| Browser | firefox | 
| Authentication Agent | polkit-kde-agent  |
| Launcher | wofi |
| File Manager | ffmpegthumbnailer file-roller gvfs thunar thunar-archive-plugin |
| Notifications | dunst  |
| Misc | feh mpv newsboat noto-fonts-emoji tldr stow wl-clipboard unzip yt-dlp |
| Terminal Emulator | kitty exa zsh |
| Screenshotting | grimblast-git |
| Screen Lock | swaylock-effects wlogout |

If you are interested in alternatives for some of these programs, you can go to [awesome-hyprland](https://github.com/hyprland-community/awesome-hyprland) list. 

```bash
yay -S dunst exa feh ffmpegthumbnailer file-roller firefox grimblast-git gvfs kitty mpv noto-fonts-emoji newsboat pamixer pavucontrol pipewire-pulse polkit-kde-agent stow swaylock-effects thunar thunar-archive-plugin wlogout tldr unzip wl-clipboard wofi yt-dlp zsh 
```

### Zsh shell with Zap
I like using zsh with zap because it's simple and fast to setup everything.

```bash
# set zsh as default shell
chsh -s $(which zsh)

# restart terminal then use 
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
```

### Copying config with Stow
Stow is a nice way of creating symlinks (Symbolic Links) according to the tree of the target, so you can use stow to quickly copy any config.

```bash
# delete kitty and hypr autogenerated config (make sure to leave hyprland before doing this)
cd .config
rm -r hypr kitty

# make sure you are in home directory before cloning this repo
cd ~ 

git clone https://github.com/gasech/hyprland-dots.git
cd hyprland-dots 

# stows only zsh
stow zsh 

# multiple stow 
stow kitty newsboat 

# stows anything that is in a folder e.g ignores README.md
stow */ 
```

### Downloading a Nerd Font
Nerd fonts allows you to have nice unicode icons and they look really nice. I personally use CascadiaCode and that's how I install them:

```bash
mkdir -p $HOME/Downloads/nerdfonts/
cd $HOME/Downloads/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.1/CascadiaCode.zip
unzip '*.zip' -d $HOME/Downloads/nerdfonts/
rm -rf *.zip
sudo cp -R $HOME/Downloads/nerdfonts/ /usr/share/fonts/
```

### GTK-XFCE Theme and Icons
You can use `nwg-look` and `xfce4-settings` to apply the theme and icons.

```bash
cd ~/Downloads
git clone https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme.git

# Installs theme
sudo cp -r Tokyo-Night-GTK-Theme/themes/Tokyonight-Dark-BL-LB /usr/share/themes/
# Installs icons
sudo cp -r Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark /usr/share/icons/

# Deletes folder
rm -r Tokyo-Night-GTK-Theme/
```

## Credits 
* [linuxmobile's hyprland dotfiles](https://github.com/linuxmobile/hyprland-dots)
* [Chris Titus Tech's hyprland dotfiles](https://github.com/ChrisTitusTech/hyprland-titus/)
