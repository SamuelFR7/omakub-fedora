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

# Geist Mono
mkdir  -p ~/.local/share/fonts/GeistMono
curl -L "https://github.com/vercel/geist-font/releases/download/1.6.0/geist-font-1.6.0.zip" -o /tmp/GeistMono.zip
unzip -o /tmp/GeistMono.zip -d ~/.local/share/fonts/GeistMono

# Geist Mono NerdFonts
curl -L "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/GeistMono.zip" -o /tmp/GeistMonoNerdFont.zip
unzip -o /tmp/GeistMonoNerdFont.zip -d ~/.local/share/fonts/NerdFonts

# San Francisco Pro
mkdir -p ~/.local/share/fonts/SFPro
curl -L "https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts/archive/refs/heads/master.zip" -o /tmp/SFPro.zip
unzip -o /tmp/SFPro.zip -d /tmp/SFPro
mv /tmp/SFPro/San-Francisco-Pro-Fonts-master/*.otf ~/.local/share/fonts/SFPro/

fc-cache -fv
