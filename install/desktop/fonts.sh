# Fontes da Microsoft
sudo dnf install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y

# JetBrains Mono
mkdir -p ~/.local/share/fonts/JetBrainsMono
curl -L "https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip" -o /tmp/JetBrainsMono.zip
unzip -o /tmp/JetBrainsMono.zip -d /tmp/JetBrainsMono
mv /tmp/JetBrainsMono/fonts/ttf/*.ttf ~/.local/share/fonts/JetBrainsMono/

# Jetbrains Mono NerdFonts
mkdir -p ~/.local/share/fonts/NerdFonts
curl -L "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" -o /tmp/JetBrainsMonoNerdFont.zip
unzip -o /tmp/JetBrainsMonoNerdFont.zip -d ~/.local/share/fonts/NerdFonts

fc-cache -fv
