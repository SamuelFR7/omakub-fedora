#!/bin/bash

# Habilitando RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Corrigindo Codecs
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf group upgrade multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf group upgrade sound-and-video -y
sudo dnf install amrnb amrwb faad2 flac gpac-libs lame libde265 libfc14audiodecoder mencoder x264 x265 ffmpegthumbnailer -y

# Instalando 1Password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install 1password -y

# Instalar o GNOME Tweaks para configurar o botão de minimizar
sudo dnf install gnome-tweaks -y

# Instalar o Google Chrome (e remover o aviso de gerenciado pela organização)
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable -y
sudo dnf remove fedora-chromium-config -y

# Instalar Brave
sudo dnf install dnf-plugins-core
sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo dnf install brave-browser

# Instalar as fontes da Microsoft
sudo dnf install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y

# Instalar aplicativos
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client
flatpak install flathub com.mattjakeman.ExtensionManager
flatpak install flathub org.localsend.localsend_app
flatpak install flathub com.todoist.Todoist
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.bitwarden.desktop
flatpak install flathub io.dbeaver.DBeaverCommunity
flatpak install flathub com.rtosta.zapzap

# Outros software
sudo dnf install ulauncher -y

# zsh
sudo dnf install zsh -y
sudo chsh -s $(which zsh)

# Ferramentas de desenvolvimento
sudo dnf copr enable atim/lazygit -y
sudo dnf install stow kitty neovim python3-neovim btop tmux eza bat fzf xclip flameshot fastfetch lazygit git-crypt openfortivpn sudo dnf install postgresql ripgrep fd-find -y
curl -sS https://starship.rs/install.sh | sh
curl https://mise.run | sh

# Docker
sudo dnf config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
