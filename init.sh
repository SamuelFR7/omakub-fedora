#!/bin/bash

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Habilitando RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Upgrading
sudo dnf upgrade -y
sudo dnf install -y curl git unzip gum

# Corrigindo Codecs
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf group upgrade multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf group upgrade sound-and-video -y
sudo dnf install amrnb amrwb faad2 flac gpac-libs lame libde265 libfc14audiodecoder mencoder x264 x265 ffmpegthumbnailer -y

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Run terminal installers
for installer in ./terminal/terminal/*.sh; do source $installer; done
for installer in ./applications/*.sh; do source $installer; done

gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
