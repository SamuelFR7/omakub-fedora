# Variables
TMP_DIR=$(mktemp -d)
POSTMAN_URL="https://dl.pstmn.io/download/latest/linux64"
INSTALL_DIR="/opt/Postman"
SYMLINK="/usr/local/bin/postman"
DESKTOP_FILE="/usr/share/applications/postman.desktop"

wget -O "$TMP_DIR/postman.tar.gz" "$POSTMAN_URL"

sudo rm -rf "$INSTALL_DIR"
sudo mkdir -p "$INSTALL_DIR"
sudo tar -xzf "$TMP_DIR/postman.tar.gz" -C /opt

sudo ln -sf /opt/Postman/Postman "$SYMLINK"

sudo tee "$DESKTOP_FILE" >/dev/null <<EOF
[Desktop Entry]
Type=Application
Name=Postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Exec=/opt/Postman/Postman
Comment=API Development Environment
Categories=Development;
Terminal=false
EOF

rm -rf "$TMP_DIR"
