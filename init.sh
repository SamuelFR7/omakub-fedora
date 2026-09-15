#!/usr/bin/env bash

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Habilitando RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instalar o driver da NVIDIA e CUDA
# A partir da série 590 a NVIDIA só distribui os módulos "open", que exigem GSP (Turing em diante).
# GPUs Maxwell, Pascal e Volta (PCI ID < 0x1e00) precisam do branch legado 580xx.
sudo dnf install -y pciutils
nvidia_gpu_id=$(lspci -n -d 10de: | awk '$2 ~ /^03/ { split($3, id, ":"); print id[2]; exit }')
if [ -n "$nvidia_gpu_id" ]; then
  if (( 16#$nvidia_gpu_id < 16#1e00 )); then
    nvidia_suffix="-580xx"
  else
    nvidia_suffix=""
  fi
  sudo dnf install akmod-nvidia$nvidia_suffix xorg-x11-drv-nvidia$nvidia_suffix-cuda xorg-x11-drv-nvidia$nvidia_suffix-cuda-libs -y
  sudo dnf install nvidia-vaapi-driver -y
fi

# Upgrading
sudo dnf upgrade -y
sudo dnf install -y curl git unzip

# Corrigindo Codecs
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf group upgrade multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf group upgrade sound-and-video -y
sudo dnf install amrnb amrwb faad2 flac gpac-libs lame libde265 libfc14audiodecoder mencoder x264 x265 ffmpegthumbnailer -y

# Run terminal installers
for installer in ./terminal/*.sh; do source $installer; done
for installer in ./applications/*.sh; do source $installer; done

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
