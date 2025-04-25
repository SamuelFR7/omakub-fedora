#!/bin/bash

DOWNLOADS_DIR="$HOME/Downloads"

wget https://dl.pstmn.io/download/latest/linux64 -O "$DOWNLOADS_DIR/postman.tar.gz"

tar -xzf "$DOWNLOADS_DIR/postman.tar.gz" -C "$DOWNLOADS_DIR"

sudo mv "$DOWNLOADS_DIR/Postman" /opt

sudo ln -sf /opt/Postman/Postman /usr/local/bin/postman

cat >"$DOWNLOADS_DIR/postman.desktop" <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

sudo mv "$DOWNLOADS_DIR/postman.desktop" /usr/share/applications/

rm "$DOWNLOADS_DIR/postman.tar.gz"
